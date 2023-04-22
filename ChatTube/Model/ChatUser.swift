//
//  ChatUser.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import Foundation

struct ChatUser {
    let uid: String
    let email: String
    let profileImageUrl: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        let shortEmail = email.components(separatedBy: "@")[0]
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}
