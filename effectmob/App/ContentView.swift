//
//  ContentView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    @State private var selectedTab = 4

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.build(view: .jobFeedView)
                    .navigationDestination(for: FinderFlowCoordinator.self) { coordinator in
                        coordinator.build()
                    }
            }
                        .tabItem {
                            Image("findTabbarIcon")
                                .renderingMode(selectedTab == 0 ? .template : .original)
                            Text("Поиск")
                        }
                        .tag(0)
                    Text("Избранное экран")
                        .tabItem {
                            Image("favoriteNormalTabbarIcon")
                                .renderingMode(selectedTab == 1 ? .template : .original)
                            Text("Избранное")
                        }
                        .tag(1)
            Text("Отклики экран")
                .tabItem {
                    Image("emailPlaceholderImage")
                        .renderingMode(selectedTab == 2 ? .template : .original)
                    Text("Отклики")
                }
                .tag(2)
            Text("Сообщения экран")
                .tabItem {
                    Image("messageTabbarIcon")
                        .renderingMode(selectedTab == 3 ? .template : .original)
                    Text("Сообщения")
                }
                .tag(3)
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.build(view: .loginView)
                    .navigationDestination(for: LoginFlowCoordinator.self) { coordinator in
                        coordinator.build()
                    }
            }
                .tabItem {
                    Image("profileTabbarIcon")
                        .renderingMode(selectedTab == 4 ? .template : .original)
                    Text("Профиль")
                }
                .tag(4)
            
                }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(.black)
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().tintColor = .blue
            UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
            UITabBar.appearance().clipsToBounds = true
                }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    ContentView()
}
