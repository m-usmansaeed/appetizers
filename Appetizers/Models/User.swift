//
//  User.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 21/11/2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}
