//
//  EnterEmailModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

// MARK: - Constants
private extension CGFloat {
    static let leadingPadding: CGFloat = 16
    static let trailingPadding: CGFloat = 18
    static let verticalSpacing: CGFloat = 16
    static let textFieldHeight: CGFloat = 40
    static let buttonWidth: CGFloat = 167
    static let buttonHeight: CGFloat = 40
    static let viewHeight: CGFloat = 179
    static let cornerRadius: CGFloat = 8.0
    static let shadowRadius: CGFloat = 10
}

struct EnterEmailModulView: View {
    // MARK: - Properties
    @State var userLoginData: UserLoginData
    @State var isValidEmail: Bool = true
    
    var continueButtonTap: (UserLoginData) -> Void
    var loginWithPasswordButtonTap: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: .verticalSpacing) {
            jobSearchText
            emailTextField
            actionButtons
        }
        .padding(.verticalSpacing)
        .frame(height: .viewHeight, alignment: .center)
        .background(Color.grey222325)
        .cornerRadius(.cornerRadius)
        .padding(.leading, .leadingPadding)
        .padding(.trailing, .trailingPadding)
    }
    
    // MARK: - Subviews
    private var jobSearchText: some View {
        HStack {
            Text("Поиск работы")
                .font(.title3)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private var emailTextField: some View {
        VStack(alignment: .leading, spacing: 14) {
            EnterEmailTextField(text: $userLoginData.email, placeholder: "Электронная почта", imageName: "emailPlaceholderImage")
                .padding()
                .frame(height: .textFieldHeight, alignment: .center)
                .background(Color.grey313234)
                .cornerRadius(.cornerRadius)
                .shadow(color: .shadows0C0C0C, radius: .shadowRadius)
                .overlay(
                    Group {
                        if !isValidEmail {
                            RoundedRectangle(cornerRadius: .cornerRadius)
                                .stroke(Color.redFF0000, lineWidth: 1)
                        }
                    }
                )
                .onChange(of: userLoginData.email) { _,_ in
                    isValidEmail = true
                }
            ZStack {
                if !isValidEmail {
                    Text("Вы ввели неверный e-mail")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .frame(height: 0, alignment: .leading)
                        .foregroundColor(.redFF0000)
                }
            }
        }
    }
    
    private var actionButtons: some View {
        HStack {
            continueButton
            Spacer()
            loginWithPasswordButton
        }
    }
    
    private var continueButton: some View {
        Button(action: {
            isValidEmail = userLoginData.email.isValidEmailFormat()
            guard isValidEmail else { return }
            continueButtonTap(userLoginData)
        }) {
            Text("Продолжить")
                .font(.buttonText2)
                .frame(width: .buttonWidth, height: .buttonHeight, alignment: .center)
                .background(Color.blue2B7EFE)
                .foregroundColor(.white)
                .cornerRadius(.cornerRadius)
                .shadow(color: .shadows0C0C0C, radius: .shadowRadius)
        }
        .overlay(
            RoundedRectangle(cornerRadius: .cornerRadius)
                .stroke(.black, lineWidth: 1)
        )
    }
    
    private var loginWithPasswordButton: some View {
        Button(action: {
           loginWithPasswordButtonTap()
        }) {
            Text("Войти с паролем")
                .font(.buttonText2)
                .background(Color.clear)
                .foregroundColor(.blue2B7EFE)
                .cornerRadius(.cornerRadius)
                .shadow(color: .shadows0C0C0C, radius: .shadowRadius)
        }
    }
}

