//
//  ConnectionsApp.swift
//  Connections
//
//  Created by student on 12/12/2023.
//

import SwiftUI

@main
struct ConnectionsApp: App {
    
    @StateObject var game = ConnectionViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ConnectionViewModel())
        }
    }
}
