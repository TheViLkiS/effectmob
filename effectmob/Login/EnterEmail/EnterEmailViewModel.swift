//
//  LoginViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import Combine

final class EnterEmailViewModel: ObservableObject {
    @Published var userLoginData: UserLoginData
    
    init(userLoginData: UserLoginData) {
        self.userLoginData = userLoginData
    }
    
    convenience init() {
        self.init(userLoginData: UserLoginData(email: "", password: ""))
    }
    
    func fetchData() {

    }
}
