//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct AppetizerCell : View {
    let appetizer: Appetizer
    @StateObject var imageLoader = ImageLoader()

    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                Image(uiImage: imageLoader.image ?? UIImage(named: "food-placeholder")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
                    .clipped()

                VStack(alignment: .leading, spacing: 5) {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("$\(appetizer.price)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    
                }.padding(.leading)
            }
        }.onAppear(perform: {
            imageLoader.load(fromURLString: appetizer.imageURL)
        })
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: MockData.sampleAppetizer)
    }
}
