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

enum HomeTab {
    case jobFeed
    case favorite
    case responses
    case messages
    case profile
}

class HomeCoordinator: ObservableObject {

    // MARK: Stored Properties

    @Published var tab = HomeTab.jobFeed
    @Published var jobFeedCoordinator: JobFeedCoordinator!
//    @Published var profileCoordinator: ProfileCoordinator!

    private let networkService: NetworkService

    // MARK: Initialization

    init(networkService: NetworkService) {
        self.networkService = networkService

        self.jobFeedCoordinator = .init(
            networkService: networkService,
            parent: self
        )
//        self.veggieCoordinator = .init(
//            title: "Veggie",
//            recipeService: recipeService,
//            parent: self,
//            filter: { $0.isVegetarian }
//        )

//        self.meatCoordinator = .init(
//            title: "Meat",
//            recipeService: recipeService,
//            parent: self,
//            filter: { !$0.isVegetarian }
//        )
    }

    // MARK: Methods

//    func open(_ url: URL) {
//        self.openedURL = url
//    }

}

//class FinderCoordinator: ObservableObject, Identifiable {
//
//    // MARK: Stored Properties
//
//    @Published var viewModel: JobFeedViewModel!
//    @Published var vacancyViewModel: VacancyViewModel?
////    @Published var ratingViewModel: RatingViewModel?
//
//    private let networkService: NetworkService
//    private unowned let parent: HomeCoordinator
//
//    // MARK: Initialization
//
//    init(title: String,
//         networkService: NetworkService,
//         parent: HomeCoordinator) {
//        self.parent = parent
//        self.networkService = networkService
//
////        self.viewModel = .init(
////            title: title,
////            recipeService: recipeService,
////            coordinator: self,
////            filter: filter
////        )
//        
//    }
//
//    // MARK: Methods
//
//    func open(_ vacancy: Vacancy) {
//        self.vacancyViewModel = .init(vacancy: vacancy)
//    }
//
////    func openRatings(for recipe: Recipe) {
////        self.ratingViewModel = .init(recipe: recipe, recipeService: recipeService, coordinator: self)
////    }
//
////    func closeRatings() {
////        self.ratingViewModel = nil
////    }
//
////    func open(_ url: URL) {
////        self.parent.open(url)
////    }
//
//}

struct HomeCoordinatorView: View {

    // MARK: Stored Properties

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

//            JobFeedCoordinatorView(coordinator: coordinator.jobFeedCoordinator)
//            .tabItem { Label("Veggie", systemImage: "leaf.fill") }
//            .tag(HomeTab.responses)

//            NavigationView {
//                SettingsView(coordinator: coordinator)
//            }
//            .navigationViewStyle(StackNavigationViewStyle())
//            .tabItem { Label("Settings", systemImage: "gear") }
//            .tag(HomeTab.settings)

        }
//        .sheet(item: $coordinator.openedURL) {
//            SafariView(url: $0)
//                .edgesIgnoringSafeArea(.all)
//        }
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

struct JobFeedCoordinatorView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: JobFeedCoordinator
    @State var finderText: String = ""
    
    // MARK: Views

    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                HStack {
                    EnterEmailTextField(text: $finderText, placeholder: "Должность, ключевые слова", imageName: "findTabbarIcon")
                        .padding()
                        .frame(height: 40, alignment: .center)
                        .background(Color(rgb: 0x313234))
                        .cornerRadius(8.0)
                        .shadow(radius: 10)
                        .padding(.trailing, 8)
                        .padding(.leading, 16)
                    Button(action: {
                    }) {
                        Image("filterJobFeedIcon")
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color(rgb: 0x313234))
                            .cornerRadius(10.0)
                            .padding(.trailing, 16)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        SuggestionView(imageName: "bluePlaceIcon", centralText: "Вакансии рядом с вами", bottomText: nil)
                            .padding(.leading, 16)
                        SuggestionView(imageName: "greenStarIcon", centralText: "Поднять резюме в поиске", bottomText: "Поднять")
                        SuggestionView(imageName: "completedTextIconpdf", centralText: "Временная работа и подработка", bottomText: nil)
                    }
                }
                HStack {
                    Text("Вакансии для вас")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    Spacer()
                }
                ScrollView(.vertical) {
                    ForEach(coordinator.viewModel.jobSearchData.vacancies) { vacancy in
                        NavigationLink(destination: vacancyView(vacancy)) {
                            VacancyCardView(vacancy: vacancy)
                                .padding(.horizontal, 16)
                                .padding(.top, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Button(action: {
                        print("Кнопка Откликнуться нажата")
                    }) {
                        Text("Еще \(coordinator.viewModel.jobSearchData.vacancies.count) вакансии")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity)
                            .frame(height: 48, alignment: .center)
                            .background(Color(rgb: 0x2B7EFE))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                            .padding(.horizontal, 16)
                            .padding(.top, 28)
                    }
                    .padding(.bottom, 16)
                }
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }

    }

    @ViewBuilder
    private func vacancyView(_ vacancy: Vacancy) -> some View {
        let viewModel = VacancyViewModel(vacancy: vacancy, coordinator: coordinator)
        VacancyFullView(viewModel: viewModel)
    }

}

class JobFeedCoordinator: ObservableObject, Identifiable {

    // MARK: Stored Properties

    @Published var viewModel: JobFeedViewModel!
    @Published var vacancyViewModel: VacancyViewModel?
//    @Published var ratingViewModel: RatingViewModel?

    private let networkService: NetworkService
    private unowned let parent: HomeCoordinator

    // MARK: Initialization

    init(
         networkService: NetworkService,
         parent: HomeCoordinator) {
        self.parent = parent
        self.networkService = networkService

//        self.viewModel = .init(
//            title: title,
//            recipeService: recipeService,
//            coordinator: self,
//            filter: filter
//        )
        self.viewModel = .init(
            networkService: networkService,
            coordinator: self
        )
    }

    // MARK: Methods

    func open(_ vacancy: Vacancy) {
//        self.detailViewModel = .init(recipe: recipe, coordinator: self)
        self.vacancyViewModel = .init(vacancy: vacancy, coordinator: self)
    }

//    func openRatings(for recipe: Recipe) {
//        self.ratingViewModel = .init(recipe: recipe, recipeService: recipeService, coordinator: self)
//    }
//
//    func closeRatings() {
//        self.ratingViewModel = nil
//    }

//    func open(_ url: URL) {
//        self.parent.open(url)
//    }

}

