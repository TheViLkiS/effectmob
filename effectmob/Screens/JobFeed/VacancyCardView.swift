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
                            .font(.text1)
                            .foregroundColor(.green4CB24E)
                    }
                    Spacer()
                }
                Text(vacancy.title)
                    .font(.title3)
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 0) {
                    Text(vacancy.address.town)
                        .font(.text1)
                        .foregroundColor(.white)
                    HStack {
                        Text(vacancy.company)
                            .font(.text1)
                            .foregroundColor(.white)
                        Image("approveCompanyIcon")
                    }
                }
                HStack(spacing: 8) {
                    Image("suitcaseVacancyIcon")
                    Text(vacancy.experience.previewText)
                        .font(.text1)
                        .foregroundColor(.white)
                }
                Text("Опубликовано \(vacancy.publishedDate.toDate(format: .yyyyMMdd).dateString())")
                    .font(.text1)
                    .foregroundColor(.grey858688)
                
                Button(action: {
                    print("Кнопка Откликнуться нажата")
                }) {
                    Text("Откликнуться")
                        .font(.buttonText2)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40, alignment: .center)
                        .background(Color.green4CB24E)
                        .foregroundColor(.white)
                        .cornerRadius(50.0)
                        .shadow(color: .shadows0C0C0C, radius: 10)
                }
                .padding(.top, 11)
            }
        }
        .padding(16)
        .background(Color.grey222325)
        .cornerRadius(8)
    }
}
