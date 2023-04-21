//
//  PickerSegment.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/11/23.
//

import SwiftUI

struct PickerSegment: View {
    @EnvironmentObject var vm: LoginViewViewModel
    
    var body: some View {
        Picker("", selection: $vm.loginMode) {
            Text("Login")
                .tag(true)
            Text("Create Account")
                .tag(false)
        }
        .pickerStyle(.segmented)
    }
}

struct PickerSegment_Previews: PreviewProvider {
    static var previews: some View {
        PickerSegment()
            .environmentObject(LoginViewViewModel())
    }
}
