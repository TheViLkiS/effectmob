//
//  UserListView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct UsersListView: View {
    @StateObject var viewModel: UsersListViewModel
    let didClickUser = PassthroughSubject<User, Never>()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Button(action: {
                    didClickUser.send(user)
                }) {
                    Text(user.name)
                }
            }
            .navigationBarTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}
