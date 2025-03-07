//
//  Item.swift
//  AnimatedLikeButtons
//
//  Created by TAAT on 2025/03/07.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
