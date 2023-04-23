//
//  MessageView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatViewVM: ChatViewViewModel
    var chatUser: ChatUser
    
    init(chatUser: ChatUser) {
        self.chatUser = chatUser
        self.chatViewVM = .init(chatUser: chatUser)
    }
    
    var body: some View {
        VStack {
            messagesBar
            bottomBar
        }
    }
    
    private var messagesBar: some View {
        ScrollView {
            ScrollViewReader { proxy in
                ForEach(chatViewVM.chatMessages) { message in
                    MessagesTextView(message: message)
                }
                HStack { Spacer() }
                    .id(chatViewVM.scrollViewReaderId)
                    .onReceive(chatViewVM.$scrollViewReader) { _ in
                        withAnimation(.easeOut(duration: 0.5)) {
                            proxy.scrollTo(chatViewVM.scrollViewReaderId, anchor: .bottom)
                        }
                    }
            }
        }
        .padding(.top, 1)
        .navigationTitle(chatUser.email)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGray6))
    }
    
    private var bottomBar: some View {
        HStack(spacing: 15) {
            Button {
                // more code here...
            } label: {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            
            TextField("Type here...", text: $chatViewVM.messageText, axis: .vertical)
            Button {
                chatViewVM.handleSend(text: chatViewVM.messageText)
            } label: {
                Text("Send")
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
        .padding(.top, 5)
        .padding(.bottom, 15)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatUser: .init(data: ["uid": "XoHIJscvsvX9ewVIRCjma6nUEOy2", "email": "mama@gmail.com"]))
    }
}
