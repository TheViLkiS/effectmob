//
//  LoginView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct EnterEmailView: View {
//    let didClickMenuItem = PassthroughSubject<String, Never>()

    @StateObject var viewModel: EnterEmailViewModel
    let didClickContinueButton = PassthroughSubject<UserLoginData, Never>()
    
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
                viewModel.userLoginData.email = email
                didClickContinueButton.send(viewModel.userLoginData)
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
#Preview {
    EnterEmailView(viewModel: EnterEmailViewModel())
}
