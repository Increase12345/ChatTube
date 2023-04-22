//
//  MainMessagesViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import Foundation

class MainMessagesViewModel: ObservableObject {

    @Published var chatUser: ChatUser?
    @Published var users = [ChatUser]()
    
    @Published var message = ""
    @Published var newMessageView = false
    
    init() {
        fetchCurrentUser()
        fetchAllUsers()
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
    
    func fetchAllUsers() {
        FirebaseManager.firestore.collection("users")
            .getDocuments { DocumentsSnapshot, error in
                if let error = error {
                    print("Failed to fetch all users \(error)")
                    return
                }
                
                DocumentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = ChatUser(data: data)
                    if user.uid != FirebaseManager.firebaseAuth.currentUser?.uid {
                        self.users.append(.init(data: data))
                    }
                })
            }
    }
}
