//
//  LoginFlowCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

class LoginCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: LoginViewModel!
    @Published var confirmEmailViewModel: ConfirmEmailViewModel?

    private let networkService: NetworkService
    private unowned let parent: HomeCoordinator

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

    func open(_ userLoginData: UserLoginData) {
        self.confirmEmailViewModel = .init(userLoginData: userLoginData, coordinator: self)
    }
}
