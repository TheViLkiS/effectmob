//
//  ConfirmEmailModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI

struct ConfirmEmailModulView: View {
    @State var userEmail: String
    @State var inputs: [String]
    @FocusState private var focusedField: Field?
    
    private var isAllNumbersInputed: Bool {
        !inputs.contains { $0.isEmpty }
    }

    private enum Field: Int, Hashable {
        case input1, input2, input3, input4
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Отправили код на \(userEmail)")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            HStack {
                ForEach(0..<4) { index in
                    EnterConfirmNumberTextField(text: $inputs[index], placeholder: "*")
                        .focused($focusedField, equals: Field(rawValue: index))
                        .onAppear {
                            focusedField = .input1
                        }
                        .onChange(of: inputs[index]) { oldValue, newValue in
                            guard newValue.allSatisfy({ "0123456789".contains($0) }) else {
                                inputs[index] = ""
                                return
                            }
                            let newCharacter = newValue.replacingOccurrences(of: oldValue, with: "")
                            inputs[index] = newCharacter == "" ? oldValue: newCharacter
                            if newValue.count >= 1 {
                                focusedField = Field(rawValue: index + 1)
                            }
                        }
                }
            }
            
            Button(action: {
                print("Кнопка 1 нажата")
            }) {
                Text("Подтвердить")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40, alignment: .center)
                    .background(isAllNumbersInputed ? Color(rgb: 0x2B7EFE): Color(rgb: 0x00427D))
                    .foregroundColor(isAllNumbersInputed ? Color.white: Color(rgb: 0x9F9F9F))
                    .cornerRadius(8.0)
                    .shadow(radius: 8.0)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .disabled(!isAllNumbersInputed)
        }
        .padding(16)
        .background(.black)
        .padding(.leading, 14)
        .padding(.trailing, 19)
    }
}
