//
//  LoginViewViewModel.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewViewModel: ObservableObject {
    @Published var actionMessage = ""
    @Published var showImagePicker = false
    @Published var profileImage: UIImage?
    
    @Published var email = ""
    @Published var password = ""
    @Published var loginMode = true
    
    func loginAction() {
        if loginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to login \(error)"
                return
            }
            
            self.actionMessage = "Successfully logged in as \(result?.user.uid ?? "")"
        }
    }
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.actionMessage = "Failed to create account \(error)"
                return
            }
            
            self.actionMessage = "Succsessfully created user \(result?.user.uid ?? "")"
            
            
        }
    }
}
