//
//  StandardButtonStyle.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 22/11/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title3.weight(.semibold))
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
    
}
