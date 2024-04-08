//
//  JobFeedViewModel.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Foundation

final class JobFeedViewModel: ObservableObject {
    let jobSearchData: JobSearchData
    
    init(jobSearchData: JobSearchData) {
        self.jobSearchData = jobSearchData
    }
}
