//
//  LoginViewViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import Foundation
import SwiftUI

class LoginViewViewModel: ObservableObject {
    
    @Published var actionMessage = ""
    @Published var showImagePicker = false
    @Published var profileImage: UIImage?
    
    @Published var email = ""
    @Published var password = ""
    @Published var loginMode = true
    
    @Published var isUserAuthorized = false
    
    init() {
        if FirebaseManager.firebaseAuth.currentUser?.uid != nil {
            isUserAuthorized = true
        } else {
            isUserAuthorized = false
        }
    }
    
    func loginAction() {
        if loginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func loginUser() {
        FirebaseManager.firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to login \(error)"
                return
            }
            
            self.email = ""
            self.password = ""
            self.isUserAuthorized = true
        }
    }
    
    func signOut() {
        try? FirebaseManager.firebaseAuth.signOut()
        isUserAuthorized = false
    }
    
    private func createNewAccount() {
        FirebaseManager.firebaseAuth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to create account \(error)"
                return
            }
            
            self.saveImageToStorage()
        }
    }
    
    private func saveImageToStorage() {
        guard let uid = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        let ref = FirebaseManager.firebaseStorage.reference(withPath: uid)
        guard let imageData = profileImage?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData) { metadata, error in
            if let error = error {
                self.actionMessage = "Failed to push image to storage \(error)"
                return
            }
            
            ref.downloadURL { url, error in
                if let error = error {
                    self.actionMessage = "Failed to retrive download url \(error)"
                    return
                }
                guard let url = url else {return}
                
                self.storeUserInformation(profileImageUrl: url)
            }
        }
    }
    
    func storeUserInformation(profileImageUrl: URL) {
        guard let uid = FirebaseManager.firebaseAuth.currentUser?.uid else { return }
        let userData = ["email": email, "uid": uid, "profileImageUrl": profileImageUrl.absoluteString] as [String : Any]
        FirebaseManager.firestore.collection("users")
            .document(uid).setData(userData) { error in
                if let error = error {
                    self.actionMessage = "Failed to store user info \(error)"
                    return
                }
                
                self.email = ""
                self.password = ""
                self.isUserAuthorized = true
            }
    }
}
