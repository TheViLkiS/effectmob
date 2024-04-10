//
//  VacancyFullView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import SwiftUI
import Combine

struct VacancyFullView: View {
    @State var vacancy: Vacancy
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(vacancy.title)
                        .font(.title1)
                        .foregroundColor(.white)
                    Text(vacancy.salary.full)
                        .font(.text1)
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Требуемый опыт: \(vacancy.experience.text)")
                            .font(.text1)
                            .foregroundColor(.white)
                        Text(vacancy.schedules.capitalizedSentence())
                        .font(.text1)
                        .foregroundColor(.white)
                    }
                    HStack {
                        if let appliedNumber = vacancy.appliedNumber {
                            LookingAppliedView(type: .applied, number: appliedNumber)
                        }
                        if let lookingNumber = vacancy.lookingNumber {
                            LookingAppliedView(type: .looking, number: lookingNumber)
                        }
                    }
                    .padding(.top, 27)
                    
                    AdressMapView(company: vacancy.company, address: vacancy.address)
                    
                    if let description = vacancy.descriptionText {
                        Text(description)
                                .font(.text1)
                                .foregroundColor(.white)
                    }
                    
                    Text("Ваши задачи")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text(vacancy.responsibilities)
                            .font(.text1)
                            .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Задайте вопрос работодателю")
                            .font(.title4)
                            .foregroundColor(.white)
                        Text("Он получит его с откликом на вакансию")
                            .font(.title4)
                            .foregroundColor(Color(rgb: 0x858688))
                    }
                    .padding(.top, 28)
                    ForEach(vacancy.questions, id: \.self) { question in
                        Button(action: {
                        }) {
                            Text(question)
                                .padding(.horizontal, 12)
                                .font(.title4)
                                .frame(height: 40, alignment: .center)
                                .background(Color(rgb: 0x313234))
                                .foregroundColor(.white)
                                .cornerRadius(50.0)
                                .shadow(radius: 10)
                        }
                    }
                    Button(action: {
                        print("Кнопка Откликнуться нажата")
                    }) {
                        Text("Откликнуться")
                            .font(.buttonText2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48, alignment: .center)
                            .background(Color(rgb: 0x4CB24E))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 10)
                    }
                    .padding(.top, 11)
                    .padding(.bottom, 16)
                }
            }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .background(.black)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Detail Title")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                // 4
                                HStack {
                                    Image("backButtonNavbarIcon")
                                }
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 16) {
                                Spacer()
                                Button(action: {
                                }) {
                                    Image("eyeIcon")
                                }
                                Button(action: {
                                }) {
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
}
