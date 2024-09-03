//
//  Item.swift
//  TodoListSwiftData
//
//  Created by Aarón Hernandez Dominguez on 02/09/24.
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
