//
//  NewMessageView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var messagesVM: MainMessagesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(messagesVM.users) { user in
                        NavigationLink {
                            ChatView(chatUser: user)
                        } label: {
                            ChatUserView(chatUser: user)
                        }
                    }
                }
            }
                .navigationTitle("New message")
                .padding()
                .scrollIndicators(.hidden)
                .toolbar {
                    Button("Cancel") {
                        dismiss()
                    }
                }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
            .environmentObject(MainMessagesViewModel())
    }
}
