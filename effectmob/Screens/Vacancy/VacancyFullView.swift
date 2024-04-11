//
//  VacancyFullView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import SwiftUI
import Combine

// MARK: - Constants
private struct Constants {
    static let topPadding: CGFloat = 27
    static let questionButtonHeight: CGFloat = 40
    static let questionButtonCornerRadius: CGFloat = 50.0
    static let applyButtonHeight: CGFloat = 48
    static let applyButtonCornerRadius: CGFloat = 8
    static let applyButtonTopPadding: CGFloat = 11
    static let applyButtonBottomPadding: CGFloat = 16
    static let smallSpacing: CGFloat = 8
    static let normalPadding: CGFloat = 16
    static let vStackSpacing: CGFloat = 16
    static let vSmallStackSpacing: CGFloat = 8
    static let hStackSpacing: CGFloat = 16
    static let shadowRadius: CGFloat = 10
    static let askEmployerSectionPadding: CGFloat = 28
    static let questionButtonsPadding: CGFloat = 12
}

struct VacancyFullView: View {
    // MARK: - Properties
    @State var vacancy: Vacancy
    @Environment(\.dismiss) private var dismiss

    // MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: Constants.vStackSpacing) {
                vacancyTitle
                vacancySalary
                vacancyDetails
                lookingAppliedViews
                    .padding(.top, Constants.topPadding)
                addressMapView
                vacancyDescription
                vacancyResponsibilities
                askEmployerSection
                questionButtons
                applyButton
                    .padding(.top, Constants.applyButtonTopPadding)
                    .padding(.bottom, Constants.applyButtonBottomPadding)
            }
        }
        .padding(.horizontal, Constants.normalPadding)
        .padding(.top, Constants.normalPadding)
        .background(.black)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Detail Title")
        .toolbar {
            leadingToolbarItem
            trailingToolbarItem
        }
    }

    // MARK: - Subviews
    var vacancyTitle: some View {
        Text(vacancy.title)
            .font(.title1)
            .foregroundColor(.white)
    }

    var vacancySalary: some View {
        Text(vacancy.salary.full)
            .font(.text1)
            .foregroundColor(.white)
    }

    var vacancyDetails: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Требуемый опыт: \(vacancy.experience.text)")
                .font(.text1)
                .foregroundColor(.white)
            Text(vacancy.schedules.capitalizedSentence())
                .font(.text1)
                .foregroundColor(.white)
        }
    }

    var lookingAppliedViews: some View {
        HStack {
            if let appliedNumber = vacancy.appliedNumber {
                LookingAppliedView(type: .applied, number: appliedNumber)
            }
            if let lookingNumber = vacancy.lookingNumber {
                LookingAppliedView(type: .looking, number: lookingNumber)
            }
        }
    }

    var addressMapView: some View {
        AddressMapView(company: vacancy.company, address: vacancy.address)
    }

    var vacancyDescription: some View {
        Group {
            if let description = vacancy.descriptionText {
                Text(description)
                    .font(.text1)
                    .foregroundColor(.white)
            } else {
                EmptyView()
            }
        }
    }

    var vacancyResponsibilities: some View {
        VStack(alignment: .leading, spacing: Constants.vSmallStackSpacing) {
            Text("Ваши задачи")
                .font(.title2)
                .foregroundColor(.white)
            Text(vacancy.responsibilities)
                .font(.text1)
                .foregroundColor(.white)
        }
    }

    var askEmployerSection: some View {
        VStack(alignment: .leading, spacing: Constants.vSmallStackSpacing) {
            Text("Задайте вопрос работодателю")
                .font(.title4)
                .foregroundColor(.white)
            Text("Он получит его с откликом на вакансию")
                .font(.title4)
                .foregroundColor(.grey858688)
        }
        .padding(.top, Constants.askEmployerSectionPadding)
    }

    var questionButtons: some View {
        ForEach(vacancy.questions, id: \.self) { question in
            Button(action: {}) {
                Text(question)
                    .padding(.horizontal, Constants.questionButtonsPadding)
                    .font(.title4)
                    .frame(height: Constants.questionButtonHeight, alignment: .center)
                    .background(Color.grey313234)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.questionButtonCornerRadius)
                    .shadow(color: .shadows0C0C0C, radius: Constants.shadowRadius)
            }
        }
    }

    var applyButton: some View {
        Button(action: {
            print("Кнопка Откликнуться нажата")
        }) {
            Text("Откликнуться")
                .font(.buttonText2)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.applyButtonHeight, alignment: .center)
                .background(Color.green4CB24E)
                .foregroundColor(.white)
                .cornerRadius(Constants.applyButtonCornerRadius)
                .shadow(color: .shadows0C0C0C, radius: Constants.shadowRadius)
        }
    }

    // MARK: - Toolbar Items
    var leadingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image("backButtonNavbarIcon")
                }
            }
        }
    }

    var trailingToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: Constants.hStackSpacing) {
                Spacer()
                Button(action: {}) {
                    Image("eyeIcon")
                }
                Button(action: {}) {
                    Image("shareIcon")
                }
                Button(action: {
                    vacancy.isFavorite.toggle()
                }) {
                    Image(vacancy.isFavorite ? "filledHearth": "favoriteNormalTabbarIcon")
                }
            }
        }
    }
}
