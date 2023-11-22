//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 21/11/2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }.offset(y: -40)
            
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-order", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
    }
}
