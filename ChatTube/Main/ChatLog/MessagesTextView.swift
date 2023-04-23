//
//  MessageView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/22/23.
//

import SwiftUI

struct MessagesTextView: View {
    let message: ChatMessage
    
    var body: some View {
        VStack {
            if message.fromId == FirebaseManager.firebaseAuth.currentUser?.uid {
                HStack {
                    Spacer()
                    HStack {
                        Text(message.messageText)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color("AccentColor"))
                    .cornerRadius(10)
                }
            } else {
                HStack {
                    HStack {
                        Text(message.messageText)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.white)
                    .cornerRadius(10)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .font(.title3)
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(message: ChatMessage(documentId: "", data: ["":""]))
//    }
//}
