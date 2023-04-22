//
//  ChatUser.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import Foundation

struct ChatUser: Identifiable {
    var id: String { uid }
    let uid: String
    let email: String
    let profileImageUrl: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}
