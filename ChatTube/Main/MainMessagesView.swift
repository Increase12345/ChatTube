//
//  MainMessagesView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/10/23.
//

import SwiftUI

struct MainMessagesView: View {
    @StateObject private var vm = MainMessagesViewModel()
    @ObservedObject var loginVM: LoginViewViewModel
    
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
                    Button("LogOut") {
                        loginVM.isAuthorized = false
                    }
                }
            }
        }
    }
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView(loginVM: LoginViewViewModel())
    }
}
