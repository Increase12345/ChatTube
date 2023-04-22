//
//  LoginView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginVM: LoginViewViewModel
    
    var body: some View {
            if !loginVM.isUserAuthorized {
                VStack {
                    VStack(spacing: 35) {
                        PickerSegment()
                        
                        ImagePickerButton()
                        
                        VStack(spacing: 20) {
                            TextField("email", text: $loginVM.email)
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                            SecureField("password", text: $loginVM.password)
                        }
                        .shadow(radius: 5)
                        
                        SignInButton()
                            .shadow(radius: 5)
                        
                        Text(loginVM.actionMessage)
                    }
                    .frame(maxWidth: 250, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                }
                .background(Image("img").resizable().scaledToFill())
                .preferredColorScheme(.light)
                .ignoresSafeArea()
                .sheet(isPresented: $loginVM.showImagePicker) {
                    ImagePicker(image: $loginVM.profileImage)
                }
            } else {
                MessagesTabView()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewViewModel())
            .environmentObject(MainMessagesViewModel())
    }
}
