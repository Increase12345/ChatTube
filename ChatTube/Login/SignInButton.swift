//
//  SignInButton.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import SwiftUI

struct SignInButton: View {
    @ObservedObject var vm: LoginViewViewModel
    
    var body: some View {
        Button {
            vm.loginAction()
        } label: {
            Text(vm.loginMode ? "Sign in": "Sign up")
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.white)
                .clipShape(Capsule())
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton(vm: LoginViewViewModel())
    }
}
