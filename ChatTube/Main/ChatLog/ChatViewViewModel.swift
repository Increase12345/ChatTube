//
//  ChatViewViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/22/23.
//

import Foundation
import Firebase

class ChatViewViewModel: ObservableObject {
    @Published var messageText = ""
    
    let chatUser: ChatUser
    
    init(chatUser: ChatUser) {
        self.chatUser = chatUser
    }
    
    func handleSend(text: String) {
        guard let fromId = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        
        let toId = chatUser.uid
        
        let document = FirebaseManager.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        let messageData = ["fromId": fromId, "toId": toId, "text": self.messageText, "timestamp": Timestamp()] as [String : Any]
        
        document.setData(messageData) { error in
            if let error = error {
                print("Failed to save message into Firestore \(error)")
                return
            }
        }
    }
}
