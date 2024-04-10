//
//  LoginView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct LoginCoordinatorView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var homeCoordinator: HomeCoordinator

    @State private var showConfirmEmailView = false
    @State private var userLoginData = UserLoginData(email: "")

    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                HStack {
                    Text("Вход в личный кабинет")
                        .font(.title2)
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
            .onAppear(perform: {
                try? modelContext.delete(model: JobSearchData.self)
                modelContext.insert(homeCoordinator.fetchData())
            })
        }
    }
    
    @ViewBuilder
    private func confirmEmailView(_ userLoginData: UserLoginData) -> some View {
        let viewModel = ConfirmEmailViewModel(userLoginData: userLoginData, coordinator: homeCoordinator.loginCoordinator)
        ConfirmEmailView(homeCoordinator: homeCoordinator, viewModel: viewModel)
    }
}
