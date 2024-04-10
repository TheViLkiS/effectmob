//
//  Font+extensions.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 10.04.24.
//

import SwiftUI

extension Font {
    
    static var title1: Font { Font.system(size: 22, weight: .semibold, design: .default) }
    static var title2: Font { Font.system(size: 20, weight: .semibold, design: .default) }
    static var title3: Font { Font.system(size: 16, weight: .medium, design: .default) }
    static var title4: Font { Font.system(size: 14, weight: .medium, design: .default) }
    
    static var text1: Font { Font.system(size: 14, weight: .regular, design: .default) }
    
    static var buttonText1: Font { Font.system(size: 16, weight: .semibold, design: .default) }
    static var buttonText2: Font { Font.system(size: 14, weight: .regular, design: .default) }
    
    static var tabText: Font { Font.system(size: 10, weight: .regular, design: .default) }
    
    static var number: Font { Font.system(size: 7, weight: .regular, design: .default) }
}
