//
//  FeedCoordinator.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import Foundation

protocol FeedCoordinator: AnyObject {
    var parent: HomeCoordinator { get }
    func open(_ vacancy: Vacancy)
}
