//
//  ImagePickerButton.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import SwiftUI

struct ImagePickerButton: View {
    @EnvironmentObject var vm: LoginViewViewModel
    
    var body: some View {
        Button {
            vm.showImagePicker.toggle()
        } label: {
            VStack {
                if let image = vm.profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .padding(30)
                }
            }
            .foregroundColor(.green)
            .frame(width: 170, height: 170)
            .overlay(
                Circle()
                    .strokeBorder(.gray)
            )
            .opacity(vm.loginMode ? 0.1: 1)
        }
        .disabled(vm.loginMode)
    }
}

struct ImagePickerButton_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerButton()
            .environmentObject(LoginViewViewModel())
    }
}
