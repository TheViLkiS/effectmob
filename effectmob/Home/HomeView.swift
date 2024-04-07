//
//  HomeView.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 06.04.24.
//

import SwiftUI
import Combine

struct HomeView: View {
    let didClickMenuItem = PassthroughSubject<String, Never>()
    @State var menuItems = ["Users", "Settings", "Profile"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems, id: \.self) { item in
                    Button(action: {
                        didClickMenuItem.send(item)
                    }) {
                        Text(item)
                    }
                }
            }
            .navigationBarTitle("MVVMC DEMO")
        }
    }
}
