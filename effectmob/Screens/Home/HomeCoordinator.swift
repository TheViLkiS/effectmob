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
    @Published var loginCoordinator: LoginCoordinator!

    private let networkService: NetworkService

    // MARK: Initialization

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
    }
}
