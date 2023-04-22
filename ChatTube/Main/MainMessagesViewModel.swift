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
                self.chatUser = .init(data: data)
            }
    }
}
