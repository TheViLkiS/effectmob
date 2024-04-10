//
//  HomeCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

enum HomeTab {
    case jobFeed
    case favorite
    case responses
    case messages
    case profile
}

struct HomeCoordinatorView: View {

    // MARK: Stored Properties
    @Environment(\.modelContext) var modelContext
    @ObservedObject var coordinator: HomeCoordinator

    // MARK: Views

    var body: some View {
        TabView(selection: $coordinator.tab) {

            JobFeedCoordinatorView(coordinator: coordinator.jobFeedCoordinator)
                .tabItem {
                    Image("findTabbarIcon")
                        .renderingMode(coordinator.tab == HomeTab.jobFeed ? .template : .original)
                    Text("Поиск")
                }
            .tag(HomeTab.jobFeed)
            
            FavoriteCoordinatorView(coordinator: coordinator.favoriteCoordinator)
                .tabItem {
                    Image("favoriteNormalTabbarIcon")
                        .renderingMode(coordinator.tab == HomeTab.favorite ? .template : .original)
                    Text("Избранное")
                }
                .tag(HomeTab.favorite)
    Text("Отклики экран")
        .tabItem {
            Image("emailPlaceholderImage")
                .renderingMode(coordinator.tab == HomeTab.responses ? .template : .original)
            Text("Отклики")
        }
        .tag(HomeTab.responses)
    Text("Сообщения экран")
        .tabItem {
            Image("messageTabbarIcon")
                .renderingMode(coordinator.tab == HomeTab.messages ? .template : .original)
            Text("Сообщения")
        }
        .tag(HomeTab.messages)
            Text("Профиль экран")
        .tabItem {
            Image("profileTabbarIcon")
                .renderingMode(coordinator.tab == HomeTab.profile ? .template : .original)
            Text("Профиль")
        }
        .tag(HomeTab.profile)

        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(.black)
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().tintColor = .blue
            UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
            UITabBar.appearance().clipsToBounds = true
                }
    }
}

#Preview {
    HomeCoordinatorView(coordinator: HomeCoordinator(networkService: NetworkService()))
}
