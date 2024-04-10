//
//  FavoriteCoordinatorView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI
import SwiftData

// MARK: - Constants
private struct Constants {
    static let titlePadding: CGFloat = 16
    static let topPadding: CGFloat = 16
    static let horizontalPadding: CGFloat = 16
    static let topCardPadding: CGFloat = 8
    static let bottomCardPadding: CGFloat = 16
    static let verticalSpacing: CGFloat = 0
}

struct FavoriteCoordinatorView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: FavoriteCoordinator
    @Query(filter: #Predicate<Vacancy> { vacancy in
        vacancy.isFavorite
    }) var favoriteVacancies: [Vacancy]
    @State var finderText: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.verticalSpacing) {
                titleView
                vacanciesCountView
                vacanciesScrollView
            }
            .background(.black)
            .modifier(DismissingKeyboard())
        }
    }
    
    // MARK: - Subviews
    private var titleView: some View {
        HStack {
            Text("Избранное")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.leading, Constants.titlePadding)
            Spacer()
        }
    }
    
    private var vacanciesCountView: some View {
        HStack {
            Text(String(format: NSLocalizedString("Num vacancy", comment: ""), favoriteVacancies.count))
                .font(.text1)
                .foregroundColor(.grey858688)
                .padding(.leading, Constants.titlePadding)
            Spacer()
        }
        .padding(.top, Constants.topPadding)
    }
    
    private var vacanciesScrollView: some View {
        ScrollView(.vertical) {
            ForEach(favoriteVacancies) { vacancy in
                NavigationLink(destination: vacancyView(vacancy)) {
                    VacancyCardView(vacancy: vacancy)
                        .padding(.horizontal, Constants.horizontalPadding)
                        .padding(.top, Constants.topCardPadding)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, Constants.bottomCardPadding)
            }
        }
    }
    
    @ViewBuilder
    private func vacancyView(_ vacancy: Vacancy) -> some View {
        VacancyFullView(vacancy: vacancy)
    }
}
