//
//  User.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 31/08/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let email: String
    let name: String
}
