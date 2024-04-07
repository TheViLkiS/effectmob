//
//  ConfirmEmailViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Combine

final class ConfirmEmailViewModel: ObservableObject {
    
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
