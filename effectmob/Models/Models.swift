//
//  Models.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Foundation
import SwiftData

@Model
class JobSearchData: ObservableObject, Codable {
    @Relationship(deleteRule: .cascade)
    let offers: [Offer]
    @Relationship(deleteRule: .cascade)
    var vacancies: [Vacancy]
    
    init(offers: [Offer], vacancies: [Vacancy]) {
        self.offers = offers
        self.vacancies = vacancies
    }
    
    enum CodingKeys: String, CodingKey {
        case offers
        case vacancies
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        offers = try container.decode([Offer].self, forKey: .offers)
        vacancies = try container.decode([Vacancy].self, forKey: .vacancies)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(offers, forKey: .offers)
        try container.encode(vacancies, forKey: .vacancies)
    }
}


@Model
class Offer: Codable, Identifiable {
    let id: String?
    let title: String
    let link: String
    @Relationship(deleteRule: .cascade)
    let button: ButtonText?
    
    init(id: String?, title: String, link: String, button: ButtonText?) {
        self.id = id
        self.title = title
        self.link = link
        self.button = button
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case link
        case button
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        link = try container.decode(String.self, forKey: .link)
//        button = try container.decodeIfPresent(ButtonText.self, forKey: .button)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(link, forKey: .link)
        try container.encodeIfPresent(button, forKey: .button)
    }
}


@Model
class ButtonText: Codable {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    enum CodingKeys: String, CodingKey {
        case text
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
    }
}

@Model
class Vacancy: Codable, Identifiable {
    let id: String
    let lookingNumber: Int?
    let title: String
    @Relationship(deleteRule: .cascade)
    let address: Address
    let company: String
    @Relationship(deleteRule: .cascade)
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    @Relationship(deleteRule: .cascade)
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let descriptionText: String?
    let responsibilities: String
    let questions: [String]
    
    init(id: String, lookingNumber: Int?, title: String, address: Address, company: String, experience: Experience, publishedDate: String, isFavorite: Bool, salary: Salary, schedules: [String], appliedNumber: Int?, descriptionText: String?, responsibilities: String, questions: [String]) {
        self.id = id
        self.lookingNumber = lookingNumber
        self.title = title
        self.address = address
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.isFavorite = isFavorite
        self.salary = salary
        self.schedules = schedules
        self.appliedNumber = appliedNumber
        self.descriptionText = descriptionText
        self.responsibilities = responsibilities
        self.questions = questions
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lookingNumber
        case title
        case address
        case company
        case experience
        case publishedDate
        case isFavorite
        case salary
        case schedules
        case appliedNumber
        case description
        case responsibilities
        case questions
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        lookingNumber = try container.decodeIfPresent(Int.self, forKey: .lookingNumber)
        title = try container.decode(String.self, forKey: .title)
        address = try container.decode(Address.self, forKey: .address)
        company = try container.decode(String.self, forKey: .company)
        experience = try container.decode(Experience.self, forKey: .experience)
        publishedDate = try container.decode(String.self, forKey: .publishedDate)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        salary = try container.decode(Salary.self, forKey: .salary)
        schedules = try container.decode([String].self, forKey: .schedules)
        appliedNumber = try container.decodeIfPresent(Int.self, forKey: .appliedNumber)
        descriptionText = try container.decodeIfPresent(String.self, forKey: .description)
        responsibilities = try container.decode(String.self, forKey: .responsibilities)
        questions = try container.decode([String].self, forKey: .questions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(lookingNumber, forKey: .lookingNumber)
        try container.encode(title, forKey: .title)
        try container.encode(address, forKey: .address)
        try container.encode(company, forKey: .company)
        try container.encode(experience, forKey: .experience)
        try container.encode(publishedDate, forKey: .publishedDate)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(salary, forKey: .salary)
        try container.encode(schedules, forKey: .schedules)
        try container.encodeIfPresent(appliedNumber, forKey: .appliedNumber)
        try container.encodeIfPresent(descriptionText, forKey: .description)
        try container.encode(responsibilities, forKey: .responsibilities)
        try container.encode(questions, forKey: .questions)
    }
}


@Model
class Address: Codable {
    let town: String
    let street: String
    let house: String
    
    init(town: String, street: String, house: String) {
        self.town = town
        self.street = street
        self.house = house
    }
    
    enum CodingKeys: String, CodingKey {
        case town
        case street
        case house
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        town = try container.decode(String.self, forKey: .town)
        street = try container.decode(String.self, forKey: .street)
        house = try container.decode(String.self, forKey: .house)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(town, forKey: .town)
        try container.encode(street, forKey: .street)
        try container.encode(house, forKey: .house)
    }
}


@Model
class Experience: Codable {
    let previewText: String
    let text: String
    
    init(previewText: String, text: String) {
        self.previewText = previewText
        self.text = text
    }
    
    enum CodingKeys: String, CodingKey {
        case previewText
        case text
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        previewText = try container.decode(String.self, forKey: .previewText)
        text = try container.decode(String.self, forKey: .text)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(previewText, forKey: .previewText)
        try container.encode(text, forKey: .text)
    }
}


@Model
class Salary: Codable {
    let full: String
    let short: String?
    
    init(full: String, short: String?) {
        self.full = full
        self.short = short
    }
    
    enum CodingKeys: String, CodingKey {
        case full
        case short
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        full = try container.decode(String.self, forKey: .full)
        short = try container.decodeIfPresent(String.self, forKey: .short)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(full, forKey: .full)
        try container.encodeIfPresent(short, forKey: .short)
    }
}

