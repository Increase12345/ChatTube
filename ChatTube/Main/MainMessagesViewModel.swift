//
//  MainMessagesViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import Foundation

class MainMessagesViewModel: ObservableObject {
    
    @Published var message = ""
    @Published var chatUser: ChatUser?
    
    init() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        
        FirebaseManager.firestore.collection("users")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    print("Failed to fetch current uder \(error)")
                    return
                }
                
                guard let data = snapshot?.data() else { return }
                
                let uid = data["uid"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let shortEmail = email.components(separatedBy: "@")[0]
                let profileImageUrl = data["profileImageUrl"] as? String ?? ""
                
                self.chatUser = ChatUser(uid: uid, email: shortEmail, profileImageUrl: profileImageUrl)
            }
    }
}
