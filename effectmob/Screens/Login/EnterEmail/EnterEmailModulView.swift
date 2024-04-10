//
//  EnterEmailModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

struct EnterEmailModulView: View {
    @State var userLoginData: UserLoginData
    @State var isValidEmail: Bool = true
    
    var continueButtonTap: (UserLoginData) -> Void
    var loginWithPasswordButtonTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Поиск работы")
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 14) {
                EnterEmailTextField(text: $userLoginData.email, placeholder: "Электронная почта", imageName: "emailPlaceholderImage")
                        .padding()
                        .frame(height: 40, alignment: .center)
                        .background(Color.grey313234)
                        .cornerRadius(8.0)
                        .shadow(color: .shadows0C0C0C, radius: 10)
                        .overlay(
                            Group {
                                if !isValidEmail {
                                    RoundedRectangle(cornerRadius: 10)
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
            
            HStack {
                Button(action: {
                    isValidEmail = userLoginData.email.isValidEmailFormat()
                    guard isValidEmail else { return }
                    continueButtonTap(userLoginData)
                }) {
                    Text("Продолжить")
                        .font(.buttonText2)
                        .frame(width: 167, height: 40, alignment: .center)
                        .background(Color.blue2B7EFE)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                        .shadow(color: .shadows0C0C0C, radius: 10)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                )
                Spacer()
                
                Button(action: {
                   loginWithPasswordButtonTap()
                }) {
                    Text("Войти с паролем")
                        .font(.buttonText2)
                        .background(Color.clear)
                        .foregroundColor(.blue2B7EFE)
                        .cornerRadius(10.0)
                        .shadow(color: .shadows0C0C0C, radius: 10)
                }
            }
        }
        .padding(16)
        .frame(height: 179, alignment: .center)
        .background(Color.grey222325)
        .cornerRadius(8)
        .padding(.leading, 16)
        .padding(.trailing, 18)
    }
}
