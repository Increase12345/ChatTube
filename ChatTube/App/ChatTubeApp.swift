//
//  ChatTubeApp.swift
//  ChatTube
//
//  Created by Nick Pavlov on 4/10/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ChatTubeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var loginVM = LoginViewViewModel()
    @StateObject var messagesVM = MainMessagesViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(loginVM)
                .environmentObject(messagesVM)
        }
    }
}
