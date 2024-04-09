////
////  VacancyFlowCoordinator.swift
////  effectmob
////
////  Created by Дмитрий Гусев on 08.04.24.
////
//
//import SwiftUI
//import Combine
//
//// Enum to identify User flow screen Types
//enum VacancyPage: String, Identifiable {
//    case fullView
//    
//    var id: String {
//        self.rawValue
//    }
//}
//
//final class VacancyFlowCoordinator: ObservableObject, Hashable {
//    @Published var page: VacancyPage
//    
//    private var id: UUID
//    private var vacancyData: Vacancy?
//    private var cancellables = Set<AnyCancellable>()
//    
//    let pushCoordinator = PassthroughSubject<LoginFlowCoordinator, Never>()
//    
//    init(page: VacancyPage, vacancyData: Vacancy? = nil) {
//        id = UUID()
//        self.page = page
//        self.vacancyData = vacancyData
//    }
//    
//    @ViewBuilder
//    func build() -> some View {
//        vacancyView()
//    }
//    
//    // MARK: Required methods for class to conform to Hashable
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: VacancyFlowCoordinator, rhs: VacancyFlowCoordinator) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//    // MARK: View Creation Methods
//    private func vacancyView() -> some View {
//        let viewModel = VacancyViewModel(vacancy: vacancyData ?? Vacancy(id: "", lookingNumber: 0, title: "", address: Address(town: "", street: "", house: ""), company: "", experience: Experience(previewText: "", text: ""), publishedDate: "", isFavorite: false, salary: Salary(full: "", short: ""), schedules: [], appliedNumber: nil, description: "", responsibilities: "", questions: []))
//        let vacancyView = VacancyFullView(viewModel: viewModel)
//        //        bind(view: enterEmailView)
//        return vacancyView
//    }
//}
