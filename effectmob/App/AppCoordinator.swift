////
////  AppCoordinator.swift
////  effectmob
////
////  Created by Дмитрий Гусев on 06.04.24.
////
//import SwiftUI
//import Combine
//
//enum FlowView {
//    case loginView
//    case jobFeedView
//    case vacancy
//}
//
//final class AppCoordinator: ObservableObject {
//    @Published var path: NavigationPath
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(path: NavigationPath) {
//        self.path = path
//    }
//    
//    @ViewBuilder
//    func build(view: FlowView) -> some View {
//        switch view {
//        case .jobFeedView:
//            jobFeedView()
//        case .loginView:
//            loginView()
//        case .vacancy:
//            vacancyView()
//        }
//    }
//    
//    private func push<T: Hashable>(_ coordinator: T) {
//        path.append(coordinator)
//    }
//    
//    private func loginView() -> some View {
//        let loginView = EnterEmailView(viewModel: EnterEmailViewModel())
//        bind(view: loginView)
//        return loginView
//    }
//    
//    private func jobFeedView() -> some View {
//        let jobFeedView = JobFeedView(viewModel: JobFeedViewModel(jobSearchData: NetworkService.fetchData() ?? JobSearchData(offers: [], vacancies: [])))
//        bind(view: jobFeedView)
//        return jobFeedView
//    }
//    
//    private func vacancyView() -> some View {
//        let vacancyView = VacancyFullView(viewModel: VacancyViewModel(vacancy: NetworkService.fetchData()!.vacancies.first!))
//        return vacancyView
//    }
//    
//    // MARK: Flow Control Methods
//    private func usersFlow() {
//        let usersFlowCoordinator = UserFlowCoordinator(page: .users)
//        self.bind(userCoordinator: usersFlowCoordinator)
//        self.push(usersFlowCoordinator)
//    }
//    
//    private func loginFlow(page: LoginPage, userLoginData: UserLoginData? = nil) {
//        let loginFlowCoordinator = LoginFlowCoordinator(page: page, userLoginData: userLoginData)
//        self.bind(loginCoordinator: loginFlowCoordinator)
//        self.push(loginFlowCoordinator)
//    }
//    
//    func jobFeedFlow(page: FindJobPage) {
//        let jobFeedFlowCoordinator = FinderFlowCoordinator(page: page)
//        self.bind(jobFeedCoordinator: jobFeedFlowCoordinator)
//        self.push(jobFeedFlowCoordinator)
//    }
//    
//    func vacancyFlow(vacancy: Vacancy) {
//        let vacancyFlowCoordinator = VacancyFlowCoordinator(page: .fullView, vacancyData: vacancy)
//        self.bind(vacancyCoordinator: vacancyFlowCoordinator)
//        self.push(vacancyFlowCoordinator)
//    }
//    
//    private func profileFlow() {
////        let profileFlowCoordinator = ProfileFlowCoordinator(page: .main)
////        self.bind(profileCoordinator: profileFlowCoordinator)
////        self.push(profileFlowCoordinator)
//    }
//    
//    // MARK: HomeView Bindings
//    private func bind(view: EnterEmailView) {
//        view.didClickContinueButton
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] userLoginData in
//                self?.loginFlow(page: .confirmEmail, userLoginData: userLoginData)
//            })
//            .store(in: &cancellables)
////        view.didClickMenuItem
////            .receive(on: DispatchQueue.main)
////                        .sink(receiveValue: { [weak self] item in
////                            switch item {
////                            case "Users":
////                                self?.usersFlow()
////                            case "Settings":
////                                break
//////                                self?.settingsFlow()
////                            case "Profile":
////                                self?.profileFlow()
////                            default:
////                                break
////                            }
////                        })
////                        .store(in: &cancellables)
//        
//    }
//    
//    private func bind(view: JobFeedView) {
//        view.didClickOnVacancy
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] vacancy in
//                self?.vacancyFlow(vacancy: vacancy)
//            })
//            .store(in: &cancellables)
//    }
//    
//    // MARK: Flow Coordinator Bindings
//    private func bind(userCoordinator: UserFlowCoordinator) {
//        userCoordinator.pushCoordinator
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] coordinator in
//                self?.push(coordinator)
//            })
//            .store(in: &cancellables)
//    }
//    
//    private func bind(loginCoordinator: LoginFlowCoordinator) {
//        loginCoordinator.pushCoordinator
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] coordinator in
//                self?.push(coordinator)
//            })
//            .store(in: &cancellables)
//    }
//    
//    private func bind(jobFeedCoordinator: FinderFlowCoordinator) {
//        jobFeedCoordinator.pushCoordinator
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] coordinator in
//                self?.push(coordinator)
//            })
//            .store(in: &cancellables)
//    }
//    
//    private func bind(vacancyCoordinator: VacancyFlowCoordinator) {
//        vacancyCoordinator.pushCoordinator
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] coordinator in
//                self?.push(coordinator)
//            })
//            .store(in: &cancellables)
//    }
//    
////    private func bind(profileCoordinator: ProfileFlowCoordinator) {
////        profileCoordinator.pushCoordinator
////            .receive(on: DispatchQueue.main)
////            .sink(receiveValue: { [weak self] coordinator in
////                self?.push(coordinator)
////            })
////            .store(in: &cancellables)
////    }
//}
