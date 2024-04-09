//
//  LoginFlowCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

class LoginCoordinator: ObservableObject, Identifiable {

    // MARK: Stored Properties

    @Published var viewModel: LoginViewModel!
    @Published var confirmEmailViewModel: ConfirmEmailViewModel?

    private let networkService: NetworkService
    private unowned let parent: HomeCoordinator

    // MARK: Initialization

    init(
        networkService: NetworkService,
        parent: HomeCoordinator) {
            self.parent = parent
            self.networkService = networkService
            
            self.viewModel = .init(
                networkService: networkService,
                coordinator: self
            )
        }

    // MARK: Methods

    func open(_ userLoginData: UserLoginData) {
        self.confirmEmailViewModel = .init(userLoginData: userLoginData, coordinator: self)
    }
}

// Enum to identify User flow screen Types
enum LoginPage: String, Identifiable {
    case enterEmail, confirmEmail
    
    var id: String {
        self.rawValue
    }
}
//
//final class LoginFlowCoordinator: ObservableObject, Hashable {
//    @Published var page: LoginPage
//    
//    private var id: UUID
//    private var userLoginData: UserLoginData?
//    private var cancellables = Set<AnyCancellable>()
//    
//    let pushCoordinator = PassthroughSubject<LoginFlowCoordinator, Never>()
//    
//    init(page: LoginPage, userLoginData: UserLoginData? = nil) {
//        id = UUID()
//        self.page = page
//        self.userLoginData = userLoginData
//    }
//    
//    @ViewBuilder
//    func build() -> some View {
//        switch self.page {
//        case .enterEmail:
//            enterEmailView()
//        case .confirmEmail:
//            confirmEmailView()
//        }
//    }
//    
//    // MARK: Required methods for class to conform to Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: LoginFlowCoordinator, rhs: LoginFlowCoordinator) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//    // MARK: View Creation Methods
//    private func enterEmailView() -> some View {
//        let viewModel = EnterEmailViewModel()
//        let enterEmailView = LoginView(viewModel: viewModel)
////        bind(view: enterEmailView)
//        return enterEmailView
//    }
//    
//    private func confirmEmailView() -> some View {
//        let viewModel = ConfirmEmailViewModel(userLoginData: userLoginData ?? UserLoginData(email: ""))
//        let confirmEmailView = ConfirmEmailView(viewModel: viewModel)
//        return confirmEmailView
//    }
//}
////// MARK: View Bindings
////        private func bind(view: EnterEmailView) {
////            view.didClickContinueButton
////                .receive(on: DispatchQueue.main)
////                .sink(receiveValue: { [weak self] userLoginData in
////                    self?.userLoginData = userLoginData
////                    self?.showConfirmScreen()
////                })
////                .store(in: &cancellables)
////        }
////    }
////    
////    // MARK: Navigation Related Extensions
////    extension LoginFlowCoordinator {
////        private func showConfirmScreen() {
////            pushCoordinator.send(LoginFlowCoordinator(page: .confirmEmail, userLoginData: userLoginData))
////        }
////    }
//    
