//
//  LoginView.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewViewModel()
    
    var body: some View {
        if !vm.isAuthorized {
            VStack {
                VStack(spacing: 35) {
                    PickerSegment(vm: vm)
                    
                    ImagePickerButton(vm: vm)
                    
                    VStack(spacing: 20) {
                        TextField("email", text: $vm.email)
                            .textContentType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        SecureField("password", text: $vm.password)
                    }
                    .shadow(radius: 5)
                    
                    SignInButton(vm: vm)
                        .shadow(radius: 5)
                    
                    Text(vm.actionMessage)
                }
                .frame(maxWidth: 250, maxHeight: .infinity)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            }
            .background(Image("img").resizable().scaledToFill())
            .preferredColorScheme(.light)
            .ignoresSafeArea()
            .sheet(isPresented: $vm.showImagePicker) {
                ImagePicker(image: $vm.profileImage)
            }
        } else {
            MainMessagesView(loginVM: vm)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
