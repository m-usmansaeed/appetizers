//
//  Order.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 21/11/2023.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price.toDouble() }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func removeItem(atOffSets: IndexSet) {
        items.remove(atOffsets: atOffSets)
    }
    
}
