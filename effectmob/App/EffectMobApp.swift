//
//  EffectMobApp.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI
import SwiftData

@main
struct EffectMobApp: App {
    @StateObject var coordinator = HomeCoordinator(networkService: NetworkService())
    @Environment(\.modelContext) var modelContext
    
//    @Query var data: [JobSearchData]

    let modelContainer: ModelContainer
    init() {
      do {
          modelContainer = try ModelContainer(for: JobSearchData.self, Offer.self, ButtonText.self, Vacancy.self, Address.self, Experience.self, Salary.self)
      } catch {
        fatalError("Could not initialize ModelContainer")
      }
    }
    
    var body: some Scene {
        WindowGroup {
            LoginCoordinatorView(homeCoordinator: coordinator)
        }
        
//        .modelContainer(for: JobSearchData.self, Offer.self, ButtonText.self, Vacancy.self, Address.self, Experience.self, Salary.self])
        .modelContainer(modelContainer)
//        .modelContext(modelContext)
    }
}
