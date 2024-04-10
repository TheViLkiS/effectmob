//
//  SuggestionView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let spacing: CGFloat = 16
    static let imagePaddingBottom: CGFloat = 78
    static let imagePaddingTop: CGFloat = 10
    static let textPaddingTop: CGFloat = 58
    static let viewPadding: CGFloat = 8
    static let frameWidth: CGFloat = 138
    static let frameHeight: CGFloat = 120
    static let cornerRadius: CGFloat = 8
}

struct SuggestionView: View {
    // MARK: - Properties
    let imageName: String
    let centralText: String
    let bottomText: String?
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            ZStack(alignment: .leading) {
                imageSection
                textSection
            }
        }
        .padding(Constants.viewPadding)
        .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
        .background(Color.grey222325)
        .cornerRadius(Constants.cornerRadius)
    }
    
    // MARK: - Subviews
    private var imageSection: some View {
        HStack {
            Image(imageName)
            Spacer()
        }
        .padding(.bottom, Constants.imagePaddingBottom)
        .padding(.top, Constants.imagePaddingTop)
    }
    
    private var textSection: some View {
        VStack(alignment: .leading) {
            Text(centralText)
                .font(.title4)
                .foregroundColor(.white)
            if let bottomText = bottomText {
                Text(bottomText)
                    .font(.text1)
                    .frame(alignment: .leading)
                    .foregroundColor(.green4CB24E)
            }
            Spacer()
        }
        .padding(.top, Constants.textPaddingTop)
    }
}
