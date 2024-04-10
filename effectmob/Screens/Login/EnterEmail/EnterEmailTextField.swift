//
//  EnterEmailTextField.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let textFieldWidth: CGFloat = 20
    static let textFieldHeight: CGFloat = 20
    static let textFieldPadding: CGFloat = 28
    static let clearButtonImageName = "texfieldClearButtonImage"
}

struct EnterEmailTextField: View {
    // MARK: - Properties
    @Binding var text: String
    var placeholder: String
    var imageName: String
    @State private var isEditing = false

    // MARK: - Body
    var body: some View {
        HStack {
            if !isEditing {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.textFieldWidth, height: Constants.textFieldHeight)
            }
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.text1)
                        .foregroundColor(.grey9F9F9F)
                }
                TextField("", text: $text, onEditingChanged: { editing in
                    isEditing = editing
                })
                .font(.text1)
                .padding(.trailing, Constants.textFieldPadding)
                .foregroundColor(.white)
                .overlay(
                    HStack {
                        Spacer()
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(Constants.clearButtonImageName, bundle: nil)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                )
            }
        }
    }
}
