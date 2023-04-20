//
//  LoginViewViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

class LoginViewViewModel: ObservableObject {
    
    let firebaseAuth = Auth.auth()
    let firebaseStorage = Storage.storage()
    let firestore = Firestore.firestore()
    
    @Published var actionMessage = ""
    @Published var showImagePicker = false
    @Published var profileImage: UIImage?
    
    @Published var email = ""
    @Published var password = ""
    @Published var loginMode = true
    
    @Published var isAuthorized = false
    
    func loginAction() {
        if loginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func loginUser() {
        firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to login \(error)"
                return
            }
            
            self.actionMessage = "Successfully logged in as \(result?.user.uid ?? "")"
            self.isAuthorized = true
        }
    }
    
    private func createNewAccount() {
        firebaseAuth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to create account \(error)"
                return
            }
            
            self.actionMessage = "Succsessfully created user \(result?.user.uid ?? "")"
            
            self.saveImageToStorage()
        }
    }
    
    private func saveImageToStorage() {
        guard let uid = firebaseAuth.currentUser?.uid else { return }
        let ref = firebaseStorage.reference(withPath: uid)
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
        guard let uid = firebaseAuth.currentUser?.uid else { return }
        let userData = ["email": email, "uid": uid, "profileImageUrl": profileImageUrl.absoluteString] as [String : Any]
        firestore.collection("users")
            .document(uid).setData(userData) { error in
                if let error = error {
                    self.actionMessage = "\(error)"
                    return
                }
                
                self.isAuthorized = true
            }
    }
}
