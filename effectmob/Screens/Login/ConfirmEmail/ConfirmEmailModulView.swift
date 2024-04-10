//
//  ConfirmEmailModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let padding: CGFloat = 16
    static let leadingPadding: CGFloat = 14
    static let trailingPadding: CGFloat = 19
    static let buttonHeight: CGFloat = 40
    static let cornerRadius: CGFloat = 8.0
    static let shadowRadius: CGFloat = 8
    static let inputFieldsCount: Int = 4
    static let spacing: CGFloat = 16
}

struct ConfirmEmailModulView: View {
    // MARK: - Properties
    @State var userEmail: String
    @State var inputs: [String]
    @FocusState private var focusedField: Field?
    var continueButtonTap: () -> Void
    
    private enum Field: Int, Hashable {
        case input1, input2, input3, input4
    }
    
    // MARK: - Computed Properties
    private var isAllNumbersInputed: Bool {
        !inputs.contains { $0.isEmpty }
    }
    
    private var buttonBackground: Color {
        isAllNumbersInputed ? Color.blue2B7EFE : Color.darkBlue00427D
    }
    
    private var buttonForeground: Color {
        isAllNumbersInputed ? Color.white : Color.grey9F9F9F
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            emailInstructions
            numberInputFields
            confirmButton
        }
        .padding(Constants.padding)
        .background(.black)
        .padding(.leading, Constants.leadingPadding)
        .padding(.trailing, Constants.trailingPadding)
    }
    
    // MARK: - Subviews
    private var emailInstructions: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            Text("Отправили код на \(userEmail)")
                .font(.title2)
                .foregroundColor(.white)
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.title3)
                .foregroundColor(.white)
        }
    }
    
    private var numberInputFields: some View {
        HStack {
            ForEach(0..<Constants.inputFieldsCount) { index in
                createNumberInputField(index: index)
            }
        }
    }
    
    private func createNumberInputField(index: Int) -> some View {
        EnterConfirmNumberTextField(text: $inputs[index], placeholder: "*")
            .focused($focusedField, equals: Field(rawValue: index))
            .onAppear {
                focusedField = .input1
            }
            .onChange(of: inputs[index]) { oldValue, newValue in
                handleInputChange(oldValue: oldValue, newValue: newValue, index: index)
            }
    }
    
    private var confirmButton: some View {
        Button(action: {
            continueButtonTap()
        }) {
            Text("Подтвердить")
                .font(.buttonText1)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.buttonHeight, alignment: .center)
                .background(buttonBackground)
                .foregroundColor(buttonForeground)
                .cornerRadius(Constants.cornerRadius)
                .shadow(color: .shadows0C0C0C, radius: Constants.shadowRadius)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1)
        )
        .disabled(!isAllNumbersInputed)
    }
    
    // MARK: - Helper Functions
    private func handleInputChange(oldValue: String, newValue: String, index: Int) {
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
