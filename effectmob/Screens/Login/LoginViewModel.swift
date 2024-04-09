//
//  LoginViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import Combine

final class LoginViewModel: ObservableObject {
    @Published var userLoginData: UserLoginData
    
    private let networkService: NetworkService
    private unowned let coordinator: LoginCoordinator
    
    init(networkService: NetworkService, coordinator: LoginCoordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
        
        self.userLoginData = networkService.fetchUserLoginData()
    }
    
    func open(_ userLoginData: UserLoginData) {
        self.coordinator.open(userLoginData)
    }
}

//final class EnterEmailViewModel: ObservableObject {
//    @Published var userLoginData: UserLoginData
//    
//    init(userLoginData: UserLoginData) {
//        self.userLoginData = userLoginData
//    }
//    
//    convenience init() {
//        self.init(userLoginData: UserLoginData(email: "", password: ""))
//    }
//    
//    func fetchData() {
//
//    }
//}
