//
//  ChatUserView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/19/23.
//

import SwiftUI

struct ChatUserView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .font(.system(size: 30))
                .padding()
                .overlay(
                Circle()
                    .strokeBorder()
                )
            VStack(alignment: .leading) {
                Text("User name")
                    .font(.title3.bold())
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
        ChatUserView()
    }
}
