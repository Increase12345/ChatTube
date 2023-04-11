//
//  MainMessagesView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/10/23.
//

import SwiftUI

struct MainMessagesView: View {
    @StateObject private var vm = MainMessagesViewModel()
    
    var body: some View {
        if vm.isAuthorized {
            Text("Main messages")
        } else {
            LoginView()
        }
    }
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}
