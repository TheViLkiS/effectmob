//
//  FavoriteViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import Foundation
import SwiftUI

final class FavoriteViewModel: ObservableObject {
    @Published var jobSearchData: JobSearchData
    
    private let networkService: NetworkService
    private unowned let coordinator: FeedCoordinator
    
    init(
        networkService: NetworkService,
        coordinator: FeedCoordinator
//        jobSearchData: JobSearchData
    ) {
        self.networkService = networkService
        self.coordinator = coordinator
        self.jobSearchData = coordinator.parent.jobSearchData
    }
    
    func open(_ vacancy: Vacancy) {
        self.coordinator.open(vacancy)
    }
}
