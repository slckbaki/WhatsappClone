//
//  WhatsappCloneApp.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 16/10/21.
//

import SwiftUI
import Firebase

@main
struct WhatsappCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
