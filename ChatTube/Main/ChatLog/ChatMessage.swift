//
//  ChatMessage.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/22/23.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Identifiable {
    //@DocumentID var id: String?
    var id: String { documentId }
    let documentId: String
    let fromId: String
    let toId: String
    let messageText: String
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.messageText = data[FirebaseConstants.messageText] as? String ?? ""
    }
}
