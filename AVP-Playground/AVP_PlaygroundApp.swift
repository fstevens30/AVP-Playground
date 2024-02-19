//
//  AVP_PlaygroundApp.swift
//  AVP-Playground
//
//  Created by Flynn Stevens on 19/02/24.
//

import SwiftUI

@main
struct AVP_PlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
