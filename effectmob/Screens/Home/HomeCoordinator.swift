//
//  HomeCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

class HomeCoordinator: ObservableObject {

    // MARK: Stored Properties

    @Published var tab = HomeTab.jobFeed
    @Published var jobFeedCoordinator: JobFeedCoordinator!
    @Published var favoriteCoordinator: FavoriteCoordinator!
    @Published var loginCoordinator: LoginCoordinator!
//    @ObservedObject var jobSearchData: JobSearchData

    private let networkService: NetworkService

    // MARK: Initialization

    init(networkService: NetworkService) {
        self.networkService = networkService
//        self.jobSearchData = networkService.fetchData()
        
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
