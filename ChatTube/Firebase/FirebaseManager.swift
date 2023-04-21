//
//  FirebaseManager.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct FirebaseManager {
    static let firebaseAuth = Auth.auth()
    static let firebaseStorage = Storage.storage()
    static let firestore = Firestore.firestore()
}
