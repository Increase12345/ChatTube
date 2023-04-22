//
//  MainMessagesView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/10/23.
//

import SwiftUI

struct MainMessagesView: View {
    @EnvironmentObject var loginVM: LoginViewViewModel
    @EnvironmentObject var messagesVM: MainMessagesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(messagesVM.users) { user in
                        NavigationLink {
                            MessageView(user: user)
                        } label: {
                            ChatUserView(chatUser: user)
                        }
                        Divider()
                    }
                }
                .navigationTitle("Chats")
                .padding()
                .toolbar {
                    Button {
                        messagesVM.newMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title3.bold())
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $messagesVM.newMessageView) {
            NewMessageView()
        }
    }
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
            .environmentObject(LoginViewViewModel())
            .environmentObject(MainMessagesViewModel())
    }
}
