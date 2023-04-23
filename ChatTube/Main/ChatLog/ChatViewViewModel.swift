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
    @Published var scrollViewReader = 0
    @Published var scrollViewReaderId = "toBottom"
    
    @Published var chatMessages = [ChatMessage]()
    
    let chatUser: ChatUser
    
    init(chatUser: ChatUser) {
        self.chatUser = chatUser
        
        fetchMessages()
    }
    
    func handleSend(text: String) {
        guard let fromId = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        let toId = chatUser.uid
        
        // current user document
        let document = FirebaseManager.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
        
        let messageData = [FirebaseConstants.fromId: fromId, FirebaseConstants.toId: toId, FirebaseConstants.messageText: self.messageText, FirebaseConstants.timestamp: Timestamp()] as [String : Any]
        
        document.setData(messageData) { error in
            if let error = error {
                print("Failed to save message into Firestore \(error)")
                return
            }
            
            self.catchLastMessage()
            
            self.messageText = ""
            self.scrollViewReader += 1
        }
        
        // receiver user document
        let recipientMessageDocument = FirebaseManager.firestore.collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
        
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print("Failed to save message into Firestore \(error)")
                return
            }
        }
    }
    
    private func fetchMessages() {
        guard let fromId = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        let toId = chatUser.uid
        
        FirebaseManager.firestore.collection("messages")
            .document(fromId)
            .collection(toId)
            .order(by: FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Failed to listen for messages \(error)")
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.chatMessages.append(.init(documentId: change.document.documentID, data: data))
                    }
                })
                
                self.scrollViewReader += 1
            }
    }
    
    private func catchLastMessage() {
        
    }
}
