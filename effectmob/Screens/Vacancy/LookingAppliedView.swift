//
//  LookingAppliedView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let spacing: CGFloat = 16
    static let padding: CGFloat = 8
    static let frameWidth: CGFloat = 160
    static let frameHeight: CGFloat = 50
    static let cornerRadius: CGFloat = 8
    static let greenProfileCircleIcon = "greenProfileCirlceIcon"
    static let greenEyeCircleIcon = "greenEyeCircleIcon"
}

struct LookingAppliedView: View {
    let type: viewType
    let number: Int
    
    enum viewType {
        case looking
        case applied
    }
    
    var text: String {
        switch type {
        case .applied:
            return String(format: NSLocalizedString("People responded", comment: ""), number)
        case .looking:
            return String(format: NSLocalizedString("People looking now", comment: ""), number)
        }
    }
    
    var image: String {
        switch type {
        case .applied:
            return Constants.greenProfileCircleIcon
        case .looking:
            return Constants.greenEyeCircleIcon
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.title4)
                        .foregroundColor(.white)
                }
                Spacer()
                Image(image)
            }
        }
        .padding(Constants.padding)
        .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
        .background(Color.darkGreen015905)
        .cornerRadius(Constants.cornerRadius)
    }
}
