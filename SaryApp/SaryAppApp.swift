//
//  SaryAppApp.swift
//  SaryApp
//
//  Created by Musab Aljarba on 06/02/1443 AH.
//

import SwiftUI

@main
struct SaryAppApp: App {
    @State static var showHUD = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(showToast: SaryAppApp.$showHUD)
        }
    }
}
