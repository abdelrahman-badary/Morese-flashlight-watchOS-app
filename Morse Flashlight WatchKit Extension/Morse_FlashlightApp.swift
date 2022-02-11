//
//  Morse_FlashlightApp.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import SwiftUI

@main
struct Morse_FlashlightApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
