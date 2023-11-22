//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order:Order
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                TabView {
                    HomeScreen()
                        .tabItem {
                            Label("Home", systemImage: "house")
                            
                        }
                    AccountView()
                        .tabItem {
                            Label("Account", systemImage: "person")
                        }
                    OrderView()
                        .tabItem {
                            Label("Order", systemImage: "bag")
                        }
                }
                
                BadgeView(geometry: geometry, badgePosition: 3, tabsCount: 3, badgeCount: order.items.count)
            }
        }
    }
}

struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}

struct BadgeView: View {
    
    let geometry: GeometryProxy
    let badgePosition: CGFloat
    let tabsCount: CGFloat
    let badgeCount: Int
    
    var body: some View {
        
        if badgeCount > 0 {
            
            Text(" \(badgeCount) ")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(minWidth: 16, idealHeight: 16)
                .background(Color.green)
                .cornerRadius(8)
                .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ) + 2, y: -25)
        }else{
            VStack { }
        }

    }
}
