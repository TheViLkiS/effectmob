//
//  Date+extensions.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 10.04.24.
//

import Foundation

extension Date {
    func dateString() -> String {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.setLocalizedDateFormatFromTemplate("d MMMM")
            return formatter.string(from: self)
        }
}
