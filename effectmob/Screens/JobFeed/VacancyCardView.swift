//
//  VacancyCardView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import SwiftUI

struct VacancyCardView: View {
    @State var vacancy: Vacancy
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Button(action: {
                vacancy.isFavorite.toggle()
            }) {
                Image(vacancy.isFavorite ? "filledHearth": "favoriteNormalTabbarIcon")
                    .frame(width: 24 ,height: 24, alignment: .trailing)
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    if let lookingNumber = vacancy.lookingNumber {
                        Text(String(format: NSLocalizedString("Now looking people", comment: ""), lookingNumber))
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(Color(rgb: 0x4CB24E))
                    }
                    Spacer()
                }
                Text(vacancy.title)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 0) {
                    Text(vacancy.address.town)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    HStack {
                        Text(vacancy.company)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        Image("approveCompanyIcon")
                    }
                }
                HStack(spacing: 8) {
                    Image("suitcaseVacancyIcon")
                    Text(vacancy.experience.previewText)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
                Text(vacancy.publishedDate)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color(rgb: 0x858688))
                
                Button(action: {
                    print("Кнопка Откликнуться нажата")
                }) {
                    Text("Откликнуться")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40, alignment: .center)
                        .background(Color(rgb: 0x4CB24E))
                        .foregroundColor(.white)
                        .cornerRadius(50.0)
                        .shadow(radius: 10)
                }
                .padding(.top, 11)
            }
        }
        .padding(16)
        .background(Color(rgb: 0x222325))
        .cornerRadius(8)
    }
}
