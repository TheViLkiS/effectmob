//
//  FavoriteCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI
import SwiftData

struct FavoriteCoordinatorView: View {
    @ObservedObject var coordinator: FavoriteCoordinator
    
    @Query(filter: #Predicate<Vacancy> { vacancy in
        vacancy.isFavorite
    }) var favoriteVacancies: [Vacancy]
    @State var finderText: String = ""
    
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
                    Text(String(format: NSLocalizedString("Num vacancy", comment: ""), favoriteVacancies.count))
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color(rgb: 0x858688))
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top, 16)
                ScrollView(.vertical) {
                    ForEach(favoriteVacancies) { vacancy in
                        NavigationLink(destination: vacancyView(vacancy)) {
                            VacancyCardView(vacancy: vacancy)
                                .padding(.horizontal, 16)
                                .padding(.top, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 16)
                    }
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
