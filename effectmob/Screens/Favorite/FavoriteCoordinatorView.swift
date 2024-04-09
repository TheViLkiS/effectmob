//
//  FavoriteCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

struct FavoriteCoordinatorView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: FavoriteCoordinator
    @State var finderText: String = ""
    
    // MARK: Views

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                HStack {
                    Text("Избранное")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    Spacer()
                }
                HStack {
                    Text("№ вакансия")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color(rgb: 0x858688))
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top, 16)
                ScrollView(.vertical) {
                    ForEach(Array(coordinator.viewModel.jobSearchData.vacancies.enumerated()), id: \.element.id) { index, vacancy in
                        if coordinator.viewModel.jobSearchData.vacancies[index].isFavorite {
                            NavigationLink(destination: vacancyView(index)) {
                                VacancyCardView(vacancy: $coordinator.viewModel.jobSearchData.vacancies[index])
                                    .padding(.horizontal, 16)
                                    .padding(.top, 8)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 16)
                        }
                    }
                }
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }

    @ViewBuilder
    private func vacancyView(_ index: Int) -> some View {
//        let viewModel = VacancyViewModel(vacancy: coordinator.parent.jobSearchData.vacancies[index], coordinator: coordinator)
        VacancyFullView(vacancy: $coordinator.viewModel.jobSearchData.vacancies[index])
    }

}

//#Preview {
//    FavoriteCoordinatorView(coordinator: FavoriteCoordinator(networkService: NetworkService(), parent: HomeCoordinator(networkService: NetworkService()), jobSearchData: <#JobSearchData#>), finderText: "")
//}
