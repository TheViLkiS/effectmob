//
//  String+extensions.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import Foundation

extension String {
    func isValidEmailFormat() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
