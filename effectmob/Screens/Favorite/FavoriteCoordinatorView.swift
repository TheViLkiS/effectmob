//
//  FavoriteCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI
import SwiftData

struct FavoriteCoordinatorView: View {

    // MARK: Stored Properties

    @ObservedObject var coordinator: FavoriteCoordinator
    @State var finderText: String = ""
    
    @Environment(\.modelContext) private var modelContext
//    @Query var favoriteVacancies: [Vacancy]
    
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
//                    ForEach(Array(coordinator.viewModel.jobSearchData.vacancies.enumerated()), id: \.element.id) { index, vacancy in
//                        if coordinator.viewModel.jobSearchData.vacancies[index].isFavorite {
//                            NavigationLink(destination: vacancyView(index)) {
//                                VacancyCardView(vacancy: $coordinator.viewModel.jobSearchData.vacancies[index])
//                                    .padding(.horizontal, 16)
//                                    .padding(.top, 8)
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .padding(.bottom, 16)
//                        }
//                    }
//                    ForEach(favoriteVacancies) { vacancy in
//                        if vacancy.isFavorite {
//                            NavigationLink(destination: vacancyView(vacancy)) {
//                                VacancyCardView(vacancy: vacancy)
//                                    .padding(.horizontal, 16)
//                                    .padding(.top, 8)
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .padding(.bottom, 16)
//                        }
//                    }
                }
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }

    @ViewBuilder
    private func vacancyView(_ vacancy: Vacancy) -> some View {
//        let viewModel = VacancyViewModel(vacancy: coordinator.parent.jobSearchData.vacancies[index], coordinator: coordinator)
        VacancyFullView(vacancy: vacancy)
    }

}

//#Preview {
//    FavoriteCoordinatorView(coordinator: FavoriteCoordinator(networkService: NetworkService(), parent: HomeCoordinator(networkService: NetworkService()), jobSearchData: <#JobSearchData#>), finderText: "")
//}
