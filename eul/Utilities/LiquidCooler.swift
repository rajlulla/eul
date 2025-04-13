//
//  LiquidCooler.swift
//  eul
//
//  Created by Raj Lulla on 2025/4/13.
//

import Foundation

struct LiquidCooler {
    struct Status {
        let temperature: Double?
        let fanSpeed: Int?
    }

    static func getStatus() -> Status? {
//        print("LiquidCooler: Attempting to get status...")

        guard let output = shell("/usr/local/bin/liquidctl --json status") else {
//            print("LiquidCooler: Failed to execute liquidctl command")
            return nil
        }

//        print("LiquidCooler: Command output:", output)

        do {
            let decoder = JSONDecoder()
            let devices = try decoder.decode([Device].self, from: output.data(using: .utf8)!)

            // Find the first device with sensor 1 and fan 1 data
            if let device = devices.first {
                let sensor1 = device.status.first(where: { $0.key == "Sensor 1" })
                let fan1 = device.status.first(where: { $0.key == "Fan 1 speed" })

//                print("LiquidCooler: Found device -", device.description)
//                print("LiquidCooler: Sensor 1 value:", sensor1?.value ?? "N/A")
//                print("LiquidCooler: Fan 1 speed:", fan1?.value ?? "N/A")

                return Status(
                    temperature: sensor1?.value,
                    fanSpeed: fan1.map { Int($0.value) }
                )
            }
        } catch {
            print("LiquidCooler: Error decoding liquid cooler data:", error)
        }

        return nil
    }
}

// MARK: - Private Types

private struct Device: Codable {
    let bus: String
    let address: String
    let description: String
    let status: [StatusItem]
}

private struct StatusItem: Codable {
    let key: String
    let value: Double
    let unit: String
}
