//
//  FavoriteCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

class FavoriteCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: FavoriteViewModel!
    @Published var vacancyViewModel: VacancyViewModel?

    private let networkService: NetworkService
    internal unowned let parent: HomeCoordinator

    init(
         networkService: NetworkService,
         parent: HomeCoordinator) {
        self.parent = parent
        self.networkService = networkService

        self.viewModel = .init(
            networkService: networkService,
            coordinator: self
        )
    }
}

extension FavoriteCoordinator: FeedCoordinator {
    func open(_ vacancy: Vacancy) {
        self.vacancyViewModel = .init(vacancy: vacancy, coordinator: self)
    }
}
