//
//  OrderView.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }.onDelete(perform: order.removeItem)
                        
                    }.listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        Text("\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom)

                }
                
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
