//
//  SuggestionView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import SwiftUI

struct SuggestionView: View {
    let imageName: String
    let centralText: String
    let bottomText: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ZStack(alignment: .leading) {
                HStack {
                    Image(imageName)
                    Spacer()
                }
                .padding(.bottom, 78)
                .padding(.top, 10)
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
                .padding(.top, 58)

            }
        }
        .padding(8)
        .frame(width: 138, height: 120, alignment: .center)
        .background(Color.grey222325)
        .cornerRadius(8)
    }
}
