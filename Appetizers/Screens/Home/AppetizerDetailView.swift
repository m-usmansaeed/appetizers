//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    @StateObject var imageLoader = ImageLoader()
    @EnvironmentObject var order : Order
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(uiImage: imageLoader.image ?? UIImage(named: "food-placeholder")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 225)
                    .clipped()
                
                VStack(spacing: 20){
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding(.horizontal)
                }
                
                Spacer()
                
                Button {
                    print("Order now pressed")
                    order.add(appetizer)
                    isShowingDetails = false
                } label: {
                    Text("$\(appetizer.price) - Order Now")
                }
                .modifier(StandardButtonStyle())
                .padding(.bottom, 30)
                
            }
            .frame(width: 300, height: 450)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .onAppear(perform: {
                imageLoader.load(fromURLString: appetizer.imageURL)
            })
            
            Button {
                isShowingDetails = false
            } label: {
                APRoundCloseButton()
                
            }
        }
        
//        .overlay(alignment: .topTrailing) {
//            Button {
//                isShowingDetails = false
//            } label: {
//                APRoundCloseButton()
//                
//            }
//        }
    }
    
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(
            appetizer: MockData.sampleAppetizer,
            isShowingDetails: .constant(true))
    }
}
