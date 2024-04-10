//
//  JobFeedCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI
import SwiftData

// MARK: - Constants
private struct Constants {
    static let textFieldHeight: CGFloat = 40
    static let textFieldCornerRadius: CGFloat = 8.0
    static let textFieldShadowRadius: CGFloat = 10
    static let buttonWidth: CGFloat = 40
    static let buttonCornerRadius: CGFloat = 10.0
    static let smallPadding: CGFloat = 8
    static let normalPadding: CGFloat = 16
    static let vStackSpacing: CGFloat = 22
    static let hStackSpacing: CGFloat = 8
    static let moreButtonHeight: CGFloat = 48
    static let moreButtonCornerRadius: CGFloat = 8
    static let moreButtonShadowRadius: CGFloat = 8
    static let moreButtonTopPadding: CGFloat = 28
    static let moreButtonBottomPadding: CGFloat = 16
}

struct JobFeedCoordinatorView: View {
    // MARK: - Properties
    @Query var vacancies: [Vacancy]
    @ObservedObject var coordinator: JobFeedCoordinator
    @State var finderText: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.vStackSpacing) {
                searchField
                suggestionsScrollView
                vacanciesTitle
                vacanciesScrollView
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }
    
    // MARK: - Subviews
    private var searchField: some View {
        HStack {
            EnterEmailTextField(text: $finderText, placeholder: "Должность, ключевые слова", imageName: "findTabbarIcon")
                .padding()
                .frame(height: Constants.textFieldHeight, alignment: .center)
                .background(Color.grey313234)
                .cornerRadius(Constants.textFieldCornerRadius)
                .shadow(color: .shadows0C0C0C, radius: Constants.textFieldShadowRadius)
                .padding(.trailing, Constants.smallPadding)
                .padding(.leading, Constants.normalPadding)
            Button(action: {}) {
                Image("filterJobFeedIcon")
                    .frame(width: Constants.buttonWidth, height: Constants.buttonWidth, alignment: .center)
                    .background(Color.grey313234)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.trailing, Constants.normalPadding)
            }
        }
    }
    
    private var suggestionsScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Constants.hStackSpacing) {
                SuggestionView(imageName: "bluePlaceIcon", centralText: "Вакансии рядом с вами", bottomText: nil)
                    .padding(.leading, Constants.normalPadding)
                SuggestionView(imageName: "greenStarIcon", centralText: "Поднять резюме в поиске", bottomText: "Поднять")
                SuggestionView(imageName: "completedTextIconpdf", centralText: "Временная работа и подработка", bottomText: nil)
            }
        }
    }
    
    private var vacanciesTitle: some View {
        HStack {
            Text("Вакансии для вас")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.leading, Constants.normalPadding)
            Spacer()
        }
    }
    
    private var vacanciesScrollView: some View {
        ScrollView(.vertical) {
            ForEach(vacancies) { vacancy in
                NavigationLink(destination: vacancyView(vacancy)) {
                    VacancyCardView(vacancy: vacancy)
                        .padding(.horizontal, Constants.normalPadding)
                        .padding(.top, Constants.smallPadding)
                }
                .buttonStyle(PlainButtonStyle())
            }
            moreButton
        }
    }
    
    private var moreButton: some View {
        Button(action: {
            print("Кнопка More нажата")
        }) {
            Text(String(format: NSLocalizedString("More vacancies", comment: ""), vacancies.count))
                .font(.buttonText2)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.moreButtonHeight, alignment: .center)
                .background(Color.blue2B7EFE)
                .foregroundColor(.white)
                .cornerRadius(Constants.moreButtonCornerRadius)
                .shadow(color: .shadows0C0C0C, radius: Constants.moreButtonShadowRadius)
                .padding(.horizontal, Constants.normalPadding)
                .padding(.top, Constants.moreButtonTopPadding)
        }
        .padding(.bottom, Constants.moreButtonBottomPadding)
    }
    
    @ViewBuilder
    private func vacancyView(_ vacancy: Vacancy) -> some View {
        VacancyFullView(vacancy: vacancy)
    }
}
