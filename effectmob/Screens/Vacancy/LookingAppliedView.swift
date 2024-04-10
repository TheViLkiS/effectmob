//
//  LookingAppliedView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

struct LookingAppliedView: View {
    let type: viewType
    let number: Int
    
    enum viewType {
        case looking
        case applied
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    switch type {
                    case .applied:
                        Text(String(format: NSLocalizedString("People responded", comment: ""), number))
                            .font(.title4)
                            .foregroundColor(.white)
                    case .looking:
                        Text(String(format: NSLocalizedString("People looking now", comment: ""), number))
                            .font(.title4)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                switch type {
                case .applied:
                    Image("greenProfileCirlceIcon")
                case .looking:
                    Image("greenEyeCircleIcon")
                }
            }
        }
        .padding(8)
        .frame(width: 160, height: 50, alignment: .center)
        .background(Color(rgb: 0x015905))
        .cornerRadius(8)
    }
}
