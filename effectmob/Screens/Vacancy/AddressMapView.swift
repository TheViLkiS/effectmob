//
//  AdressMapView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 09.04.24.
//

import SwiftUI

// MARK: - Constants
private struct Constants {
    static let horizontalPadding: CGFloat = 16
    static let verticalPadding: CGFloat = 12
    static let cornerRadius: CGFloat = 8
    static let approveCompanyIcon = "approveCompanyIcon"
    static let googleMap = "googleMap"
}

struct AddressMapView: View {
    // MARK: - Properties
    let company: String
    let address: Address
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            companyView
            mapView
            addressView
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.grey222325)
        .cornerRadius(Constants.cornerRadius)
    }

    // MARK: - Subviews
    var companyView: some View {
        HStack {
            Text(company)
                .font(.title3)
                .foregroundColor(.white)
            Image(Constants.approveCompanyIcon)
        }
    }

    var mapView: some View {
        Image(Constants.googleMap)
            .resizable()
    }

    var addressView: some View {
        Text([address.town, address.street, address.house].joined(separator: " ,"))
            .font(.text1)
            .foregroundColor(.white)
    }
}

