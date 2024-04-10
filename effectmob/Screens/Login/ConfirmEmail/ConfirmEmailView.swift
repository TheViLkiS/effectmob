//
//  ConfirmEmailView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

// MARK: - Constants
private struct Constants {
    static let inputsCount: Int = 4
}

struct ConfirmEmailView: View {
    // MARK: - Properties
    @StateObject var homeCoordinator: HomeCoordinator
    @StateObject var viewModel: ConfirmEmailViewModel
    @State private var email: String = ""
    @State private var inputs = Array(repeating: "", count: Constants.inputsCount)
    @State private var isNumberInputed: Bool = false

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                confirmEmailModuleView
                Spacer()
            }
            .navigationDestination(isPresented: $isNumberInputed) {
                homeView
                    .navigationBarBackButtonHidden(true)
            }
        }
        .background(.black)
    }

    // MARK: - View Components
    private var confirmEmailModuleView: some View {
        ConfirmEmailModulView(userEmail: viewModel.userLoginData.email, inputs: inputs, continueButtonTap: {
            isNumberInputed = true
        })
    }

    @ViewBuilder
    private var homeView: some View {
        HomeCoordinatorView(coordinator: homeCoordinator)
    }
}

