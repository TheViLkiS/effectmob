//
//  ConfirmEmailView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

import SwiftUI
import Combine

struct ConfirmEmailView: View {
    @StateObject var homeCoordinator: HomeCoordinator
    @StateObject var viewModel: ConfirmEmailViewModel
    @State private var email: String = ""
    @State private var inputs = Array(repeating: "", count: 4)
    @State private var isNumberInputed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ConfirmEmailModulView(userEmail: viewModel.userLoginData.email, inputs: inputs, continueButtonTap: {
                    isNumberInputed = true
                })
                Spacer()
            }
            .navigationDestination(isPresented: $isNumberInputed) {
                homeView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .background(.black)
    }
    
    @ViewBuilder
    private func homeView() -> some View {
        HomeCoordinatorView(coordinator: homeCoordinator)
    }
}
