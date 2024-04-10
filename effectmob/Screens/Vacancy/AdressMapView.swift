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
                    .font(.title3)
                    .foregroundColor(.white)
                Image("approveCompanyIcon")
            }
            Image("googleMap")
                .resizable()
            Text([address.town, address.street, address.house].joined(separator: " ,"))
                    .font(.text1)
                    .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.grey222325)
        .cornerRadius(8)
    }
}
