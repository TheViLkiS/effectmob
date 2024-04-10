//
//  LoginView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

// MARK: - Constants
private struct Constants {
    static let titlePadding: CGFloat = 16
    static let verticalSpacing: CGFloat = 22
}

struct LoginCoordinatorView: View {
    // MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @ObservedObject var homeCoordinator: HomeCoordinator

    @State private var showConfirmEmailView = false
    @State private var userLoginData = UserLoginData(email: "")
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            loginScreen
        }
    }
    
    // MARK: - Subviews
    private var loginScreen: some View {
        VStack(spacing: Constants.verticalSpacing) {
            loginTitle
            Spacer()
            emailEntryModule
            FindEmployeesModulView()
            Spacer()
                .navigationDestination(isPresented: $showConfirmEmailView) {
                    confirmEmailView(userLoginData)
                }
        }
        .background(.black)
        .modifier(DismissingKeyboard())
        .onAppear(perform: deleteOldDataAndFetchNew)
    }
    
    private var loginTitle: some View {
        HStack {
            Text("Вход в личный кабинет")
                .font(.title2)
                .foregroundColor(.white)
                .padding(Constants.titlePadding)
            Spacer()
        }
    }
    
    private var emailEntryModule: some View {
        EnterEmailModulView(userLoginData: homeCoordinator.loginCoordinator.viewModel.userLoginData, continueButtonTap: { userLoginData in
            self.userLoginData = userLoginData
            self.showConfirmEmailView = true
        }, loginWithPasswordButtonTap: { })
    }
    
    @ViewBuilder
    private func confirmEmailView(_ userLoginData: UserLoginData) -> some View {
        let viewModel = ConfirmEmailViewModel(userLoginData: userLoginData, coordinator: homeCoordinator.loginCoordinator)
        ConfirmEmailView(homeCoordinator: homeCoordinator, viewModel: viewModel)
    }
    
    // MARK: - Helper Functions
    private func deleteOldDataAndFetchNew() {
        try? modelContext.delete(model: JobSearchData.self)
        modelContext.insert(homeCoordinator.fetchData())
    }
}

