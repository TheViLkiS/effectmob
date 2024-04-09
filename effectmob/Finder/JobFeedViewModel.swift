//
//  JobFeedViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Foundation

final class JobFeedViewModel: ObservableObject {
    @Published var jobSearchData: JobSearchData
    
    private let networkService: NetworkService
    private unowned let coordinator: JobFeedCoordinator
    
    init(
        networkService: NetworkService,
        coordinator: JobFeedCoordinator
    ) {
        self.networkService = networkService
        self.coordinator = coordinator
        
        self.jobSearchData = networkService.fetchData()
    }
    
    func open(_ vacancy: Vacancy) {
        self.coordinator.open(vacancy)
    }
}
