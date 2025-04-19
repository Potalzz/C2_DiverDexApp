//
//  ProfileGridView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileGridView: View {
    let profiles: [ProfileCardModel]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(profiles) { profile in
                    ProfileCardView(profile: profile)
                        .padding(.vertical, 8)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileGridView(profiles: DummyData.sampleProfileDatas)
}
