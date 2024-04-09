//
//  EffectMobApp.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

@main
struct EffectMobApp: App {
    @StateObject var coordinator = HomeCoordinator(networkService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            HomeCoordinatorView(coordinator: coordinator)
        }
    }
}
