//
//  VacancyFullView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import SwiftUI
import Combine

struct VacancyFullView: View {
    @ObservedObject var viewModel: VacancyViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {

        ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(viewModel.vacancy.title)
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                    Text(viewModel.vacancy.salary.full)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Требуемый опыт: \(viewModel.vacancy.experience.text)")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        Text(viewModel.vacancy.schedules.capitalizedSentence())
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    }
                    HStack {
                        lookingAppliedView(type: .applied, number: 235)
                        lookingAppliedView(type: .looking, number: 122)
                    }
                    .padding(.top, 27)
                    
                    AdressMapView(company: viewModel.vacancy.company, address: viewModel.vacancy.address)
                    
                    if let description = viewModel.vacancy.description {
                        Text(description)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(.white)
                    }
                    
                    Text("Ваши задачи")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                    
                    Text(viewModel.vacancy.responsibilities)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Задайте вопрос работодателю")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        Text("Он получит его с откликом на вакансию")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(Color(rgb: 0x858688))
                    }
                    .padding(.top, 28)
                    ForEach(viewModel.vacancy.questions, id: \.self) { question in
                        Button(action: {
                        }) {
                            Text(question)
                                .padding(.horizontal, 12)
                                .font(.system(size: 14, weight: .medium, design: .default))
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
                            .font(.system(size: 14, weight: .regular, design: .default))
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
//        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .background(.black)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Detail Title")
                    // 1
                    .toolbar {

                        // 2
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
                                    viewModel.vacancy.isFavorite.toggle()
                                }) {
                                    Image(viewModel.vacancy.isFavorite ? "filledHearth": "favoriteNormalTabbarIcon")
                                }
                            }
                        }
                    }
    }
}

#Preview {
    VacancyFullView(viewModel: VacancyViewModel(vacancy: NetworkService.fetchData()!.vacancies.first!))
}

struct AdressMapView: View {
    let company: String
    let address: Address
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(company)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image("approveCompanyIcon")
            }
            Image("googleMap")
                .resizable()
            Text([address.town, address.street, address.house].joined(separator: " ,"))
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(rgb: 0x313234))
        .cornerRadius(8)
    }
}

struct lookingAppliedView: View {
    let type: viewType
    let number: Int
    
    enum viewType {
        case looking
        case applied
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    
                    switch type {
                    case .applied:
                        Text("\(number) человек уже откликнулись")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    case .looking:
                        Text("\(number) человека сейчас смотрят")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
                switch type {
                case .applied:
                    Image("greenProfileCirlceIcon")
                case .looking:
                    Image("greenEyeCircleIcon")
                }
            }
        }
        .padding(8)
        .frame(width: 160, height: 50, alignment: .center)
        .background(Color(rgb: 0x015905))
        .cornerRadius(8)
        
    }
    
}
