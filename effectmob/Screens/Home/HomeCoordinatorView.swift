//
//  HomeCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine
import SwiftData

private let templateRenderingMode = Image.TemplateRenderingMode.template
private let originalRenderingMode = Image.TemplateRenderingMode.original

enum HomeTab: String, CaseIterable {
    case jobFeed = "Поиск"
    case favorite = "Избранное"
    case responses = "Отклики"
    case messages = "Сообщения"
    case profile = "Профиль"
    
    var icon: String {
        switch self {
        case .jobFeed: return "findTabbarIcon"
        case .favorite: return "favoriteNormalTabbarIcon"
        case .responses: return "emailPlaceholderImage"
        case .messages: return "messageTabbarIcon"
        case .profile: return "profileTabbarIcon"
        }
    }
}

struct HomeCoordinatorView: View {
    // MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @ObservedObject var coordinator: HomeCoordinator
    @Query(filter: #Predicate<Vacancy> { vacancy in
        vacancy.isFavorite
    }) var favoriteVacancies: [Vacancy]

    // MARK: - Body
    var body: some View {
        TabView(selection: $coordinator.tab) {
            ForEach(HomeTab.allCases, id: \.self) { tab in
                self.view(for: tab)
                    .tabItem {
                        Image(tab.icon)
                            .renderingMode(coordinator.tab == tab ? templateRenderingMode : originalRenderingMode)
                        Text(tab.rawValue)
                    }
                    .tag(tab)
            }
        }
        .onAppear(perform: setupTabBarAppearance)
    }
    
    // MARK: - Helper Functions
    private func view(for tab: HomeTab) -> some View {
        switch tab {
        case .jobFeed:
            return AnyView(JobFeedCoordinatorView(coordinator: coordinator.jobFeedCoordinator))
        case .favorite:
            return AnyView(FavoriteCoordinatorView(coordinator: coordinator.favoriteCoordinator).badge(favoriteVacancies.count))
        case .responses, .messages, .profile:
            return AnyView(Text("\(tab.rawValue) экран"))
        }
    }
    
    private func setupTabBarAppearance() {
        UITabBar.appearance().backgroundColor = UIColor(.black)
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = UIColor(Color.blue2B7EFE)
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
    }
}
