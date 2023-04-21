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
                    ForEach(0..<10, id: \.self) { _ in
                        ChatUserView()
                        Divider()
                    }
                }
                .navigationTitle("Chats")
                .padding()
                .toolbar {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title3.bold())
                    }
                }
            }
        }
        .task {
            messagesVM.fetchCurrentUser()
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
