//
//  ContentView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build()
                .navigationDestination(for: LoginFlowCoordinator.self) { coordinator in
                    coordinator.build()
                }
//                .navigationDestination(for: SettingsFlowCoordinator.self) { coordinator in
//                    coordinator.build()
//                }
//                .navigationDestination(for: ProfileFlowCoordinator.self) { coordinator in
//                    coordinator.build()
//                }
        }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    ContentView()
}
