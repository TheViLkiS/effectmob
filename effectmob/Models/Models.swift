//
//  Models.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Foundation

struct JobSearchData: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer: Identifiable, Codable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonText?
}

struct ButtonText: Codable {
    let text: String
}

struct Vacancy: Identifiable, Codable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Codable {
    let town: String
    let street: String
    let house: String
}

struct Experience: Codable {
    let previewText: String
    let text: String
}

struct Salary: Codable {
    let full: String
    let short: String?
}
