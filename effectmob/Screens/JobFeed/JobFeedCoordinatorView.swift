//
//  JobFeedCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI
import SwiftData

struct JobFeedCoordinatorView: View {
    @Query var vacancies: [Vacancy]
    @ObservedObject var coordinator: JobFeedCoordinator
    @State var finderText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 22) {
                HStack {
                    EnterEmailTextField(text: $finderText, placeholder: "Должность, ключевые слова", imageName: "findTabbarIcon")
                        .padding()
                        .frame(height: 40, alignment: .center)
                        .background(Color(rgb: 0x313234))
                        .cornerRadius(8.0)
                        .shadow(radius: 10)
                        .padding(.trailing, 8)
                        .padding(.leading, 16)
                    Button(action: {
                    }) {
                        Image("filterJobFeedIcon")
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color(rgb: 0x313234))
                            .cornerRadius(10.0)
                            .padding(.trailing, 16)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        SuggestionView(imageName: "bluePlaceIcon", centralText: "Вакансии рядом с вами", bottomText: nil)
                            .padding(.leading, 16)
                        SuggestionView(imageName: "greenStarIcon", centralText: "Поднять резюме в поиске", bottomText: "Поднять")
                        SuggestionView(imageName: "completedTextIconpdf", centralText: "Временная работа и подработка", bottomText: nil)
                    }
                }
                HStack {
                    Text("Вакансии для вас")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    Spacer()
                }
                ScrollView(.vertical) {
                    ForEach(vacancies) { vacancy in
                            NavigationLink(destination: vacancyView(vacancy)) {
                                VacancyCardView(vacancy: vacancy)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 8)
                            }
                            .buttonStyle(PlainButtonStyle())
                    }
                    Button(action: {
                        print("Кнопка Откликнуться нажата")
                    }) {
                        Text(String(format: NSLocalizedString("More vacancies", comment: ""), vacancies.count))
                            .font(.buttonText2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48, alignment: .center)
                            .background(Color(rgb: 0x2B7EFE))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 8)
                            .padding(.horizontal, 16)
                            .padding(.top, 28)
                    }
                    .padding(.bottom, 16)
                }
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }

    @ViewBuilder
    private func vacancyView(_ vacancy: Vacancy) -> some View {
        VacancyFullView(vacancy: vacancy)
    }

}
