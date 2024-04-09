//
//  VacancyViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import Foundation

final class VacancyViewModel: ObservableObject {
    @Published var vacancy: Vacancy
    
    private unowned let coordinator: JobFeedCoordinator
    
    init(vacancy: Vacancy, coordinator: JobFeedCoordinator) {
        self.vacancy = vacancy
        self.coordinator = coordinator
    }
    
    func open(_ vacancy: Vacancy) {
        self.coordinator.open(vacancy)
    }
}
