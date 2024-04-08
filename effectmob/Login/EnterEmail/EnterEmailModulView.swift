//
//  EnterEmailModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

struct EnterEmailModulView: View {
    @State var email: String = ""
    @State var isValidEmail: Bool = true
    
    var continueButtonTap: (String) -> Void
    var loginWithPasswordButtonTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Поиск работы")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 14) {
                EnterEmailTextField(text: $email, placeholder: "Электронная почта", imageName: "emailPlaceholderImage")
                        .padding()
                        .frame(height: 40, alignment: .center)
                        .background(Color(rgb: 0x313234))
                        .cornerRadius(8.0)
                        .shadow(radius: 10)
                        .overlay(
                            Group {
                                if !isValidEmail {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(rgb: 0xFF0000), lineWidth: 1)
                                }
                            }
                        )
                        .onChange(of: email) { _,_ in
                            isValidEmail = true
                        }
                ZStack {
                    if !isValidEmail {
                        Text("Вы ввели неверный e-mail")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .frame(height: 0, alignment: .leading)
                            .foregroundColor(Color(rgb: 0xFF0000))
                    }
                }
            }
            
            HStack {
                Button(action: {
                    print(NetworkService.fetchData())

                    isValidEmail = email.isValidEmailFormat()
                    guard isValidEmail else { return }
                    continueButtonTap(email)
                }) {
                    Text("Продолжить")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(width: 167, height: 40, alignment: .center)
                        .background(Color(rgb: 0x2B7EFE))
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                        .shadow(radius: 10)
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
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .background(Color.clear)
                        .foregroundColor(Color(rgb: 0x2B7EFE))
                        .cornerRadius(10.0)
                        .shadow(radius: 10)
                }
            }
        }
        .padding(16)
        .frame(height: 179, alignment: .center)
        .background(Color(rgb: 0x222325))
        .cornerRadius(8)
        .padding(.leading, 16)
        .padding(.trailing, 18)
    }
}
