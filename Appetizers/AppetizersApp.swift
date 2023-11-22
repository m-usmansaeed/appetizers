//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
