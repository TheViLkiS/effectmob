//
//  UserDetailViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

final class UserDetailsViewModel: ObservableObject {
    @Published var profile:Profile?
    private var userID: Int
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func fetchProfile() {
        self.profile = Profile(id: 05,
                               name: "Jone Doe",
                               age: 25,
                               occupation: "Doctor")
    }
}
