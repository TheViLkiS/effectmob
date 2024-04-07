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
    @StateObject var viewModel: ConfirmEmailViewModel
    let didClickMenuItem = PassthroughSubject<LoginPage, Never>()
    @State private var email: String = ""
    @State private var inputs = Array(repeating: "", count: 4)
    
    var body: some View {
        VStack {
            Spacer()
            ConfirmEmailModulView(userEmail: viewModel.userLoginData.email, inputs: inputs)
            Spacer()
        }
        .background(.black)
    }
}

#Preview {
    ConfirmEmailView(viewModel: ConfirmEmailViewModel())
}
