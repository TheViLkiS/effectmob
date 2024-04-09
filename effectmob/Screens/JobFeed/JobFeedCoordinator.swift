//
//  JobFeedCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

class JobFeedCoordinator: ObservableObject, Identifiable {

    // MARK: Stored Properties

    @Published var viewModel: JobFeedViewModel!
    @Published var vacancyViewModel: VacancyViewModel?

    private let networkService: NetworkService
    private unowned let parent: HomeCoordinator

    // MARK: Initialization

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

    // MARK: Methods

    func open(_ vacancy: Vacancy) {
        self.vacancyViewModel = .init(vacancy: vacancy, coordinator: self)
    }
}
