//
//  ChatUserView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/19/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatUserView: View {
    let chatUser: ChatUser
    
    var body: some View {
        HStack(spacing: 15) {
            WebImage(url: URL(string: chatUser.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay(
                Circle()
                    .strokeBorder()
                    .foregroundColor(.secondary)
                )
            
            VStack(alignment: .leading) {
                Text(chatUser.email)
                    .font(.title3.bold())
                    .foregroundColor(.primary)
                Text("message")
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("22d")
                .foregroundColor(.secondary)
        }
    }
}

struct ChatUserView_Previews: PreviewProvider {
    static var previews: some View {
        ChatUserView(chatUser: ChatUser(data: .init()))
    }
}
