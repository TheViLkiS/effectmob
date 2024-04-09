//
//  FindEmployeesModulView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI

struct FindEmployeesModulView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("Поиск сотрудников")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Spacer()
                }
                Text("Размещение вакансий и доступ к базе резюме")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.white)
            }
            
            Button(action: {
                print("Кнопка 1 нажата")
            }) {
                Text("Я ищу сотрудников")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40, alignment: .center)
                    .background(Color(rgb: 0x4CB24E))
                    .foregroundColor(.white)
                    .cornerRadius(50.0)
                    .shadow(radius: 10)
            }
        }
        .padding(16)
        .frame(height: 141, alignment: .center)
        .background(Color(rgb: 0x222325))
        .cornerRadius(8)
        .padding(.leading, 16)
        .padding(.trailing, 18)
    }
}
