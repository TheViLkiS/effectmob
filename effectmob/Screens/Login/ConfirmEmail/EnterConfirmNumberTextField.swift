//
//  EnterConfirmNumberTextField.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct EnterConfirmNumberTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Image("staroflife.fill", bundle: nil)
                            .foregroundColor(.white)
                            .padding()
                }
                TextField("", text: $text)
                .keyboardType(.decimalPad)
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .onReceive(Just(text)) { newValue in
                    guard let lastChar = newValue.last, "0123456789".contains(lastChar)  else {
                        self.text = ""
                        return
                    }
                    self.text = String(lastChar)
                }
                
            }
        }
        .frame(width: 48, height: 48, alignment: .center)
        .background(Color(rgb: 0x313234))
        .cornerRadius(8)
    }
}
