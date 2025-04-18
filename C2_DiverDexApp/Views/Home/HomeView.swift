//
//  HomeView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    let profiles = DummyData.sampleProfileDatas

    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                HeaderView()
                SearchView()
                NavigationLink() {
                    ProfileDetailPageView()
                } label: {
                    ProfileGridView(profiles: profiles)
                }
            }
            .background(Color.Background)
            .hideKeyboardWhenTappedAround()
        }
    }
}

#Preview {
    HomeView()
}
