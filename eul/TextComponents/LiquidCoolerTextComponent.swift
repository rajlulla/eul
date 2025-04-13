//
//  LiquidCoolerTextComponent.swift
//  eul
//
//  Created by Raj Lulla on 2025/4/13.
//

import Foundation
import SwiftyJSON

enum LiquidCoolerTextComponent: String, CaseIterable, Identifiable, Codable, JSONCodabble {
    case fanSpeed
    case temperature

    var id: String {
        rawValue
    }

    static var defaultComponents: [LiquidCoolerTextComponent] {
        [.fanSpeed, .temperature]
    }
}
