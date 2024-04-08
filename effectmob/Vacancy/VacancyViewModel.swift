//
//  VacancyViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

import Foundation

final class VacancyViewModel: ObservableObject {
    @Published var vacancy: Vacancy
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
    }
}
