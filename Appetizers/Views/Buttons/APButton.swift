//
//  APButton.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .foregroundColor(.white)

    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Button")
    }
}
