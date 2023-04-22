//
//  MessagesTabView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/19/23.
//

import SwiftUI

struct MessagesTabView: View {
    
    var body: some View {
        TabView {
            MainMessagesView()
                .tabItem {
                    Image(systemName: "ellipsis.message")
                    Text("Messages")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct MessagesTabView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesTabView()
    }
}