//
//  Color+.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//
import SwiftUI

extension Color {
    
    static var black000000: Color { Color(rgb: 0x000000) }
    static var white: Color { Color(rgb: 0xFFFFFF)}
    static var grey222325: Color { Color(rgb: 0x222325)}
    static var grey313234: Color { Color(rgb: 0x313234)}
    static var grey858688: Color { Color(rgb: 0x858688)}
    static var grey9F9F9F: Color { Color(rgb: 0x9F9F9F)}
    static var greyDBDBDB: Color { Color(rgb: 0xDBDBDB)}
    static var blue2B7EFE: Color { Color(rgb: 0x2B7EFE)}
    static var darkBlue00427D: Color { Color(rgb: 0x00427D)}
    static var green4CB24E: Color { Color(rgb: 0x4CB24E)}
    static var darkGreen015905: Color { Color(rgb: 0x015905)}
    static var redFF0000: Color { Color(rgb: 0xFF0000)}
    static var shadows0C0C0C: Color { Color(rgb: 0x0C0C0C).opacity(0.9)}
    
    init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0
        )
    }
    
}
