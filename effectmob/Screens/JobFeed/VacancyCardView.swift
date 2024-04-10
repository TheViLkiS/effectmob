//
//  VacancyCardView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let buttonFrameSize: CGFloat = 24
    static let cornerRadius: CGFloat = 8
    static let bigCornerRadius: CGFloat = 50
    static let padding: CGFloat = 16
    static let topPadding: CGFloat = 11
    static let shadowRadius: CGFloat = 10
    static let buttonHeight: CGFloat = 40
    static let spacing: CGFloat = 10
    static let smallSpacing: CGFloat = 8
}

struct VacancyCardView: View {
    // MARK: - Properties
    @State var vacancy: Vacancy

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing){
            favoriteButton
            vacancyDetails
        }
        .padding(Constants.padding)
        .background(Color.grey222325)
        .cornerRadius(Constants.cornerRadius)
    }
    
    // MARK: - Subviews
    private var favoriteButton: some View {
        Button(action: toggleFavorite) {
            Image(vacancy.isFavorite ? "filledHearth": "favoriteNormalTabbarIcon")
                .frame(width: Constants.buttonFrameSize, height: Constants.buttonFrameSize, alignment: .trailing)
                .foregroundColor(.white)
        }
    }
    
    private var vacancyDetails: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            lookingPeopleText
            vacancyTitle
            addressAndCompany
            experience
            publishedDate
            responseButton
        }
    }
    
    private var lookingPeopleText: some View {
        HStack {
            if let lookingNumber = vacancy.lookingNumber {
                Text(String(format: NSLocalizedString("Now looking people", comment: ""), lookingNumber))
                    .font(.text1)
                    .foregroundColor(.green4CB24E)
            }
            Spacer()
        }
    }
    
    private var vacancyTitle: some View {
        Text(vacancy.title)
            .font(.title3)
            .foregroundColor(.white)
    }
    
    private var addressAndCompany: some View {
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
    }
    
    private var experience: some View {
        HStack(spacing: Constants.smallSpacing) {
            Image("suitcaseVacancyIcon")
            Text(vacancy.experience.previewText)
                .font(.text1)
                .foregroundColor(.white)
        }
    }
    
    private var publishedDate: some View {
        Text("Опубликовано \(vacancy.publishedDate.toDate(format: .yyyyMMdd).dateString())")
            .font(.text1)
            .foregroundColor(.grey858688)
    }
    
    private var responseButton: some View {
        Button(action: {
            print("Кнопка Откликнуться нажата")
        }) {
            Text("Откликнуться")
                .font(.buttonText2)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.buttonHeight, alignment: .center)
                .background(Color.green4CB24E)
                .foregroundColor(.white)
                .cornerRadius(Constants.bigCornerRadius)
                .shadow(color: .shadows0C0C0C, radius: Constants.shadowRadius)
        }
        .padding(.top, Constants.topPadding)
    }
    
    // MARK: - Helper Functions
    private func toggleFavorite() {
        vacancy.isFavorite.toggle()
    }
}

