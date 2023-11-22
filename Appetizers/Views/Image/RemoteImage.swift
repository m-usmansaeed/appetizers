//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiimage in
            guard let uiimage = uiimage else { return }
            DispatchQueue.main.async {
                self.image = uiimage
            }
        }
    }
}
