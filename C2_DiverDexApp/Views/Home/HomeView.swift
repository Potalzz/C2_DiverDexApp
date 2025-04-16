//
//  HomeView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    let profiles = ProfileCardModel.sampleProfileDatas
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        ZStack {
            Color("Background")
            VStack(spacing: 15) {
                // 상단 로고, 프로필 아이콘
                HStack {
                    Text("DiverDex")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("KeyColor"))
                        
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 15)

                SearchView()

                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(profiles) { profile in
                            ProfileCardView(model: profile)
                                .padding(.vertical, 8)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .hideKeyboardWhenTappedAround()
    }
}

#Preview {
    HomeView()
}
