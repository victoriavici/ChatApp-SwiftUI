//
//  Model.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import Foundation
import FirebaseAuth

@MainActor
class Model: ObservableObject {
    
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try? await request.commitChanges()
    }
}
