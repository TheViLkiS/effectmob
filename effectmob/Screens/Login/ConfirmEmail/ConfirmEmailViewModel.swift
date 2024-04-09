//
//  ConfirmEmailViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Combine

final class ConfirmEmailViewModel: ObservableObject {
    @Published var userLoginData: UserLoginData
    
    private unowned let coordinator: LoginCoordinator
    
    init(userLoginData: UserLoginData, coordinator: LoginCoordinator) {
        self.userLoginData = userLoginData
        self.coordinator = coordinator
    }
    
    func open(_ userLoginData: UserLoginData) {
        self.coordinator.open(userLoginData)
    }
}
