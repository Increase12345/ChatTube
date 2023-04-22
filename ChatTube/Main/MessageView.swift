//
//  MessageView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import SwiftUI

struct MessageView: View {
    var user: ChatUser
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle(user.email)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(user: ChatUser(data: .init()))
    }
}
