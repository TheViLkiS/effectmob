//
//  Color+.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

extension Color {
    init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0
        )
    }
}
