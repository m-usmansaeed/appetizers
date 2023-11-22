//
//  View.Ext.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 21/11/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    var tintColor: some View {
        if #available(iOS 15, *) {
            self.tint(.red)
        } else {
            self.accentColor(.red)
        }
    }
}

public extension View {
    func modify<Content>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
        transform(self)
    }
}


