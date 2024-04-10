//
//  FavoriteViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import Foundation
import SwiftUI

final class FavoriteViewModel: ObservableObject {
    private let networkService: NetworkService
    private unowned let coordinator: FeedCoordinator
    
    init(
        networkService: NetworkService,
        coordinator: FeedCoordinator
    ) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func open(_ vacancy: Vacancy) {
        self.coordinator.open(vacancy)
    }
}
