//
//  ErrorWrapper.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 14/09/2023.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    var guidance: String = ""
}
