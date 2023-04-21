//
//  SettingsView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/19/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: LoginViewViewModel
    @EnvironmentObject var messagesVM: MainMessagesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = messagesVM.chatUser?.profileImageUrl {
                    WebImage(url: URL(string: image))
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                } else {
                    Image(systemName: "person.fill")
                        .font(.system(size: 200))
                }
                Text(messagesVM.chatUser?.email ?? "email")
                    .font(.title3.bold())
            }
            Form {
                HStack {
                    Spacer()
                    Button {
                        loginVM.signOut()
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(LoginViewViewModel())
            .environmentObject(MainMessagesViewModel())
    }
}
