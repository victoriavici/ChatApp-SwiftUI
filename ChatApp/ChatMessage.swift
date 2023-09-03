//
//  ChatMessage.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 31/08/2023.
//

import Foundation
import FirebaseFirestore

struct ChatMessage: Codable, Identifiable, Equatable {
    
    var documentID: String?
    let text: String
    let uid: String
    var dateCreated = Date()
    let displayName: String
    
    var id: String {
        documentID ?? UUID().uuidString
    }
    
}

extension ChatMessage {
    func toDictionary() -> [String: Any] {
        return [
            "text": text,
            "uid": uid,
            "dateCreated": dateCreated,
            "displayName": displayName
        ]
    }
    
    static func fromSnapshot(snapshot: QueryDocumentSnapshot) -> ChatMessage? {
        let dictionary = snapshot.data()
        guard let text = dictionary["text"] as? String,
              let uid = dictionary["uid"] as? String,
              let dateCreated = (dictionary["dateCreated"] as? Timestamp)?.dateValue(),
              let displayName = dictionary["displayName"] as? String else {
            return nil
        }
        
        return ChatMessage(documentID: snapshot.documentID, text: text, uid:uid, dateCreated: dateCreated, displayName: displayName)
    }
}
