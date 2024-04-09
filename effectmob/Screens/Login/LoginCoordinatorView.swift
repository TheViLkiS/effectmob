//
//  LoginView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct LoginCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var homeCoordinator: HomeCoordinator
    
    @State private var showConfirmEmailView = false
    @State private var userLoginData = UserLoginData(email: "")
    
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }
    // MARK: Views

    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                HStack {
                    Text("Вход в личный кабинет")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding(16)
                    Spacer()
                }
                Spacer()
                EnterEmailModulView(userLoginData: homeCoordinator.loginCoordinator.viewModel.userLoginData, continueButtonTap: { userLoginData in
                    self.userLoginData = userLoginData
                    self.showConfirmEmailView = true
                }, loginWithPasswordButtonTap: { })
                FindEmployeesModulView()
                Spacer()
                    .navigationDestination(isPresented: $showConfirmEmailView) {
                        confirmEmailView(userLoginData)
                    }
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }
    
    @ViewBuilder
    private func confirmEmailView(_ userLoginData: UserLoginData) -> some View {
        let viewModel = ConfirmEmailViewModel(userLoginData: userLoginData, coordinator: homeCoordinator.loginCoordinator)
        ConfirmEmailView(homeCoordinator: homeCoordinator, viewModel: viewModel)
    }
}
