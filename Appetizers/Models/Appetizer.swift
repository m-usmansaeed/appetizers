//
//  Appetizers.swift
//  Appetizer
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import Foundation

struct Appetizer: Codable, Identifiable {
    var id : String
    var description : String
    var name : String
    var price : String
    var imageURL : String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.description = try container.decode(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(String.self, forKey: .price)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
    }
    
    init(id: String, description: String,
         name: String, price: String,
         imageURL: String) {
        
        self.id = id
        self.description = description
        self.name = name
        self.price  = price
        self.imageURL = imageURL
    }
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: "0",
                                           description: "This is the description for my appetizer. It's yummy.", name: "Test Appetizer",
                                           price: "9.9",
                                           imageURL: "")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: "1",
                                        description: "This is the description for my appetizer. It's yummy.", name: "Test Appetizer One",
                                        price: "9.9",
                                        imageURL: "")
    
    static let orderItems = [orderItemOne,
                             Appetizer(id: "2",
                                       description: "This is the description for my appetizer. It's yummy.", name: "Test Appetizer Two",
                                       price: "9.9",
                                       imageURL: ""),
                             Appetizer(id: "3",
                                       description: "This is the description for my appetizer. It's yummy.", name: "Test Appetizer Three",
                                       price: "9.9",
                                       imageURL: "")]
}
