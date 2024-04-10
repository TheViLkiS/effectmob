//
//  EffectMobApp.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI
import SwiftData


//MARK: - Захардкоженный текст был в условии ТЗ. Конечно, я обычно так не делаю.
@main
struct EffectMobApp: App {
    
    @StateObject var coordinator = HomeCoordinator(networkService: NetworkService())
    @Environment(\.modelContext) var modelContext
    
    let modelContainer: ModelContainer?
    init() {
        modelContainer = EffectMobApp.initializeModelContainer()
    }
    
    var body: some Scene {
        
        WindowGroup {
            if let modelContainer = modelContainer {
                LoginCoordinatorView(homeCoordinator: coordinator)
                    .modelContainer(modelContainer)
            } else {
                LoginCoordinatorView(homeCoordinator: coordinator)
            }
        }
    }
    
    private static func initializeModelContainer() -> ModelContainer? {
        
        let modelType = JobSearchData.self
        do {
            return try ModelContainer(for: modelType)
        } catch {
            print("Could not initialize ModelContainer: \(error)")
            return nil
        }
    }
}

