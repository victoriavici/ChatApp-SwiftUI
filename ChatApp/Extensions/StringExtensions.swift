//
//  StringExtensions.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 24/08/2023.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
