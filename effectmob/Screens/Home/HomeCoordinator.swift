//
//  HomeCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

class HomeCoordinator: ObservableObject {
    
    @Published var tab = HomeTab.jobFeed
    @Published var jobFeedCoordinator: JobFeedCoordinator!
    @Published var favoriteCoordinator: FavoriteCoordinator!
    @Published var loginCoordinator: LoginCoordinator!

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
        
        self.jobFeedCoordinator = .init(
            networkService: networkService,
            parent: self
        )
        self.loginCoordinator = .init(
            networkService: networkService,
            parent: self
        )
        self.favoriteCoordinator = .init(
            networkService: networkService,
            parent: self
        )
    }
    
    func fetchData() -> JobSearchData {
        networkService.fetchData()
    }
}
