//
//  AdressMapView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

struct AdressMapView: View {
    let company: String
    let address: Address
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(company)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image("approveCompanyIcon")
            }
            Image("googleMap")
                .resizable()
            Text([address.town, address.street, address.house].joined(separator: " ,"))
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(rgb: 0x313234))
        .cornerRadius(8)
    }
}
