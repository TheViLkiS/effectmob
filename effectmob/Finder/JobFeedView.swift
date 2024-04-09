//
//  JobFeedView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI
import Combine

//struct JobFeedView: View {
//    let didClickMenuItem = PassthroughSubject<String, Never>()
//    @State var finderText: String = ""
//    @StateObject var viewModel: JobFeedViewModel
////    let didClickContinueButton = PassthroughSubject<UserLoginData, Never>()
//    let didClickOnVacancy = PassthroughSubject<Vacancy, Never>()
//    
//    var body: some View {
//        VStack(spacing: 22) {
//            HStack {
//                EnterEmailTextField(text: $finderText, placeholder: "Должность, ключевые слова", imageName: "findTabbarIcon")
//                    .padding()
//                    .frame(height: 40, alignment: .center)
//                    .background(Color(rgb: 0x313234))
//                    .cornerRadius(8.0)
//                    .shadow(radius: 10)
//                    .padding(.trailing, 8)
//                    .padding(.leading, 16)
//                Button(action: {
//                }) {
//                    Image("filterJobFeedIcon")
//                        .frame(width: 40, height: 40, alignment: .center)
//                        .background(Color(rgb: 0x313234))
//                        .cornerRadius(10.0)
//                        .padding(.trailing, 16)
//                }
//            }
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 8) {
//                    SuggestionView(imageName: "bluePlaceIcon", centralText: "Вакансии рядом с вами", bottomText: nil)
//                        .padding(.leading, 16)
//                    SuggestionView(imageName: "greenStarIcon", centralText: "Поднять резюме в поиске", bottomText: "Поднять")
//                    SuggestionView(imageName: "completedTextIconpdf", centralText: "Временная работа и подработка", bottomText: nil)
//                }
//            }
//            HStack {
//                Text("Вакансии для вас")
//                    .font(.system(size: 20, weight: .semibold, design: .default))
//                    .foregroundColor(.white)
//                    .padding(.leading, 16)
//                Spacer()
//            }
//            ScrollView(.vertical) {
//                ForEach(viewModel.jobSearchData.vacancies) { vacancy in
//                    VacancyCardView(vacancy: vacancy)
//                                        .padding(.horizontal, 16)
//                                        .padding(.top, 8)
//                                        .onTapGesture {
//                                            didClickOnVacancy.send(vacancy)
//                                        }
//                }
//                Button(action: {
//                    print("Кнопка Откликнуться нажата")
//                }) {
//                    Text("Еще \(viewModel.jobSearchData.vacancies.count) вакансии")
//                        .font(.system(size: 14, weight: .regular, design: .default))
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 48, alignment: .center)
//                        .background(Color(rgb: 0x2B7EFE))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .shadow(radius: 8)
//                        .padding(.horizontal, 16)
//                        .padding(.top, 28)
//                }
//                .padding(.bottom, 16)
//            }
//        }
//        .background(.black)
//        .modifier(DismissingKeyboard())
//
//    }
//}
//
//#Preview {
//    JobFeedView(viewModel: JobFeedViewModel(jobSearchData: NetworkService.fetchData()!))
//}
