//
//  EnterConfirmNumberTextField.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

// MARK: - Constants
private struct Constants {
    static let imageSize: CGFloat = 48
    static let cornerRadius: CGFloat = 8
    static let validCharacters: String = "0123456789"
}

struct EnterConfirmNumberTextField: View {
    // MARK: - Properties
    @Binding var text: String
    var placeholder: String

    // MARK: - Body
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    emptyTextFieldImage
                }
                textField
            }
        }
        .frame(width: Constants.imageSize, height: Constants.imageSize, alignment: .center)
        .background(Color.grey313234)
        .cornerRadius(Constants.cornerRadius)
    }

    // MARK: - View Components
    private var emptyTextFieldImage: some View {
        Image("staroflife.fill", bundle: nil)
            .foregroundColor(.white)
            .padding()
    }

    private var textField: some View {
        TextField("", text: $text)
            .keyboardType(.decimalPad)
            .font(.largeNumbers)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .onReceive(Just(text)) { newValue in
                processInput(newValue)
            }
    }

    // MARK: - Helper Functions
    private func processInput(_ input: String) {
        guard let lastChar = input.last, Constants.validCharacters.contains(lastChar) else {
            self.text = ""
            return
        }
        self.text = String(lastChar)
    }
}
