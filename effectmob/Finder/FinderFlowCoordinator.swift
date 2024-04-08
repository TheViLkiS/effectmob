//
//  FinderFlowCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI
import Combine

// Enum to identify User flow screen Types
enum FindJobPage: String, Identifiable {
    case feed
    
    var id: String {
        self.rawValue
    }
}

final class FinderFlowCoordinator: ObservableObject, Hashable {
    @Published var page: FindJobPage
    
    private var id: UUID
    private var jobSearchData: JobSearchData?
    private var cancellables = Set<AnyCancellable>()
    
    let pushCoordinator = PassthroughSubject<LoginFlowCoordinator, Never>()
    
    init(page: FindJobPage, jobSearchData: JobSearchData? = nil) {
        id = UUID()
        self.page = page
        self.jobSearchData = jobSearchData
    }
    
    @ViewBuilder
    func build() -> some View {
//        switch self.page {
//        case .feed:
            jobFeedView()
//        }
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FinderFlowCoordinator, rhs: FinderFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: View Creation Methods
    private func jobFeedView() -> some View {
        let viewModel = JobFeedViewModel(jobSearchData: NetworkService.fetchData() ?? JobSearchData(offers: [], vacancies: []))
        let jobFeedView = JobFeedView(viewModel: viewModel)
//        bind(view: enterEmailView)
        return jobFeedView
    }
    
//    private func confirmEmailView() -> some View {
//        let viewModel = ConfirmEmailViewModel(userLoginData: userLoginData ?? UserLoginData(email: ""))
//        let confirmEmailView = ConfirmEmailView(viewModel: viewModel)
//        return confirmEmailView
//    }
}
