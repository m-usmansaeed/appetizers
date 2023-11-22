//
//  APRoundCloseButton.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct APRoundCloseButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .renderingMode(.template)
                .imageScale(.small)
                .frame(width: 44, height: 44)
                //.accentColor(.brandPrimary)
//                .tint(.brandPrimary)
        }
    }
}

struct APRoundCloseButton_Previews: PreviewProvider {
    static var previews: some View {
        APRoundCloseButton()
    }
}
