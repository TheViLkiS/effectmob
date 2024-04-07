//
//  EnterEmailTextField.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

struct EnterEmailTextField: View {
    @Binding var text: String
    var placeholder: String
    var imageName: String
    @State private var isEditing = false

    var body: some View {
        HStack {
            if !isEditing {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color(rgb: 0x9F9F9F))
                }
                TextField("", text: $text, onEditingChanged: { editing in
                    isEditing = editing
                })
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.white)
                .overlay(
                    HStack {
                        Spacer()
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image("texfieldClearButtonImage", bundle: nil)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                )
            }
        }
    }
}
