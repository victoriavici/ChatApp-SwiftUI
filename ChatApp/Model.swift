//
//  Model.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class Model: ObservableObject {
    
    @Published var groups: [Group] = []
    
    func updateDisplayName(for user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try? await request.commitChanges()
    }
    
    func populateGroups() async throws {
        
        let db = Firestore.firestore()
        let snapshot = try await db.collection("group")
            .getDocuments()
        groups = snapshot.documents.compactMap { snapshot in
            Group.fromSnapshot(snapshot: snapshot)
        }
    }
    
    func saveGroup(group: Group, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        var docRef: DocumentReference? = nil
        docRef = db.collection("groups")
            .addDocument(data: group.toDictionary()) { [weak self] error in
                if error != nil {
                    completion(error)
                } else {
                    if let docRef {
                        var newGroup = group
                        newGroup.documentId = docRef.documentID
                        self?.groups.append(newGroup)
                        completion(nil)
                    } else {
                        completion(nil)
                    }
                }
            }
    }
}
