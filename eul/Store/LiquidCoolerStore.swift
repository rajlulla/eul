//
//  LiquidCoolerStore.swift
//  eul
//
//  Created by Raj Lulla on 2025/4/13.
//

import Combine
import Foundation
import SwiftUI

class LiquidCoolerStore: ObservableObject, Refreshable {
    private var activeCancellable: AnyCancellable?

    @ObservedObject var componentsStore = SharedStore.components
    @ObservedObject var menuComponentsStore = SharedStore.menuComponents

    @Published var temperature: Double?
    @Published var fanSpeed: Int?
    @Published var temperatureHistory: [Double] = []

    var temperatureString: String? {
        guard let temp = temperature else { return nil }
        return String(format: "%.1f°C", temp)
    }

    var fanSpeedString: String? {
        guard let speed = fanSpeed else { return nil }
        return "\(speed) RPM"
    }

    init() {
        initObserver(for: .StoreShouldRefresh)
        activeCancellable = Publishers
            .CombineLatest(componentsStore.$activeComponents, menuComponentsStore.$activeComponents)
            .sink { _ in
                DispatchQueue.main.async {
                    self.refresh()
                }
            }
    }

    @objc func refresh() {
        guard
            componentsStore.activeComponents.contains(.LiquidCooler)
            || menuComponentsStore.activeComponents.contains(.LiquidCooler)
        else {
            return
        }

        if let status = LiquidCooler.getStatus() {
            temperature = status.temperature
            fanSpeed = status.fanSpeed
            if let temp = status.temperature {
                temperatureHistory = (temperatureHistory + [temp]).suffix(LineChart.defaultMaxPointCount)
            }
        }
    }
}
