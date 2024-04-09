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

    @ObservedObject var coordinator: LoginCoordinator
    
    let didClickContinueButton = PassthroughSubject<UserLoginData, Never>()
    
    // MARK: Views

    var body: some View {
        VStack(spacing: 22) {
            HStack {
                Text("Вход в личный кабинет")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(16)
                Spacer()
            }
            Spacer()
            EnterEmailModulView(continueButtonTap: { email in
                coordinator.viewModel.userLoginData.email = email
                didClickContinueButton.send(coordinator.viewModel.userLoginData)
            },
                                loginWithPasswordButtonTap: {
            })
            FindEmployeesModulView()
            Spacer()
        }
        .background(.black)
        .modifier(DismissingKeyboard())
    }
}
