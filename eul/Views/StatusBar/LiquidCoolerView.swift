//
//  LiquidCoolerView.swift
//  eul
//
//  Created by Gao Sun on 2024/3/21.
//  Copyright © 2024 Gao Sun. All rights reserved.
//

import SwiftUI

struct LiquidCoolerView: View {
    @EnvironmentObject var liquidCoolerStore: LiquidCoolerStore
    @EnvironmentObject var componentConfigStore: ComponentConfigStore
    @EnvironmentObject var textStore: ComponentsStore<LiquidCoolerTextComponent>

    var config: EulComponentConfig {
        componentConfigStore[.LiquidCooler]
    }

    var texts: [String] {
        textStore.activeComponents.map {
            switch $0 {
            case .fanSpeed:
                return liquidCoolerStore.fanSpeedString ?? "N/A"
            case .temperature:
                return liquidCoolerStore.temperatureString ?? "N/A"
            }
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            if config.showIcon {
                Image("LiquidCooler")
                    .resizable()
                    .frame(width: 13, height: 13)
            }
            if textStore.showComponents {
                StatusBarTextView(texts: texts)
                    .stableWidth()
            }
        }
    }
}
