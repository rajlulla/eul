//
//  LiquidCoolerMenuBlockView.swift
//  eul
//
//  Created by Raj Lulla on 2025/4/13.
//

import SharedLibrary
import SwiftUI

struct LiquidCoolerMenuBlockView: View {
    @EnvironmentObject var liquidCoolerStore: LiquidCoolerStore

    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center) {
                Text("Liquid Cooler")
                    .menuSection()
                Spacer()
                LineChart(points: liquidCoolerStore.temperatureHistory, frame: CGSize(width: 35, height: 20))
            }
            SeparatorView()
            HStack {
                if let temp = liquidCoolerStore.temperature {
                    MiniSectionView(title: "Temperature", value: String(format: "%.1f°C", temp))
                }
                if let fanSpeed = liquidCoolerStore.fanSpeed {
                    Spacer()
                    MiniSectionView(title: "Fan Speed", value: "\(fanSpeed) RPM")
                }
            }
        }
        .padding(.top, 2)
        .menuBlock()
    }
}
