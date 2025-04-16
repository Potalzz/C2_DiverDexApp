//
//  HomeView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    let profiles = ProfileCardModel.sampleProfileDatas

    var body: some View {
        ZStack {
            Color("Background")

            VStack(spacing: 15) {
                HeaderView()
                SearchView()
                ProfileGridView(profiles: profiles)
            }
        }
        .hideKeyboardWhenTappedAround()
    }
}

#Preview {
    HomeView()
}
