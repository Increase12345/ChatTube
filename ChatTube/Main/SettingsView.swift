//
//  SettingsView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/19/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: LoginViewViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 200))
                Text("K0li4ka")
                    .font(.title3.bold())
            }
            Form {
                HStack {
                    Spacer()
                    Button {
                        loginVM.isAuthorized = false
                    } label: {
                        Text("Log out")
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
    }
}
