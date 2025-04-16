//
//  ProfileCard.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileCardView: View {
    let profile: ProfileCardModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color("ProfileCardBackground"))
                .frame(width: 164, height: 111)
                .shadow(color: Color(.systemGray3), radius: 2, x: 1, y: 1)

            HStack {
                VStack(alignment: .center) {
                    Text(profile.nickname)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: 60)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                    CategoryTag(profile: profile)
                }
                .padding(.leading, 10)
                
                Image(profile.ProfileImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(.bottom, 10)
                    .padding(.leading, 5)
            }
        }
    }
}

#Preview {
//    HomeView()
    ProfileCardView(profile: DummyData.sampleProfileDatas[1])
    ProfileCardView(profile: DummyData.sampleProfileDatas[3])
    ProfileCardView(profile: DummyData.sampleProfileDatas[6])
}
