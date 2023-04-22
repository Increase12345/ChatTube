//
//  MessageView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/21/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var user: ChatUser
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<10) { _ in
                    HStack {
                        Spacer()
                        HStack {
                            Text("Fake message")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color("AccentColor"))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                HStack { Spacer() }
            }
            .navigationTitle(user.email)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGray6))
            
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.title)
                        .foregroundColor(.secondary)
                }
                
                TextField("Type here...", text: $messageText)
                Button {
                    
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
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: .init(data: ["uid": "XoHIJscvsvX9ewVIRCjma6nUEOy2", "email": "mama@gmail.com"]))
    }
}
