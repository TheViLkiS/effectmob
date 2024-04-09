//
//  ContentView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
//    @State private var selectedTab = 4
    
    @ObservedObject var coordinator: HomeCoordinator

    var body: some View {
        TabView(selection: $coordinator.tab) {
            JobFeedCoordinatorView(coordinator: coordinator.jobFeedCoordinator)
                        .tabItem {
                            Image("findTabbarIcon")
                                .renderingMode(coordinator.tab == HomeTab.jobFeed ? .template : .original)
                            Text("Поиск")
                        }
                        .tag(0)
                    Text("Избранное экран")
                        .tabItem {
                            Image("favoriteNormalTabbarIcon")
                                .renderingMode(coordinator.tab == HomeTab.favorite ? .template : .original)
                            Text("Избранное")
                        }
                        .tag(1)
            Text("Отклики экран")
                .tabItem {
                    Image("emailPlaceholderImage")
                        .renderingMode(coordinator.tab == HomeTab.responses ? .template : .original)
                    Text("Отклики")
                }
                .tag(2)
            Text("Сообщения экран")
                .tabItem {
                    Image("messageTabbarIcon")
                        .renderingMode(coordinator.tab == HomeTab.messages ? .template : .original)
                    Text("Сообщения")
                }
                .tag(3)
            Text("Избранное экран")
                .tabItem {
                    Image("profileTabbarIcon")
                        .renderingMode(coordinator.tab == HomeTab.profile ? .template : .original)
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
//        .environmentObject(appCoordinator)
    }
}

//#Preview {
//    ContentView(coordinator: HomeCoordinator(networkService: NetworkService()))
//}
