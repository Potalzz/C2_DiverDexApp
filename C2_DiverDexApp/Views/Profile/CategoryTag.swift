//
//  CategoryTag.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct CategoryTag: View {
    let profile: ProfileCardModel
    let isDetail: Bool
    
    init(profile: ProfileCardModel, isDetail: Bool = false) {
        self.profile = profile
        self.isDetail = isDetail
    }

    var body: some View {
        ZStack {
            Capsule()
                .foregroundStyle(Color("ProfileCardBackground"))
                .opacity(0.2)
                .shadow(color: .black, radius: 1, x: 0.7, y: 0.5)
                .frame(width: isDetail ? profile.category.boxSize * 1.3 : profile.category.boxSize, height: isDetail ? 26 : 20)
            Text(profile.category.rawValue)
                .font(isDetail ? .callout : .caption)
                .fontWeight(.semibold)
                .foregroundStyle(Color(profile.category.color))
        }
    }
}

#Preview {
    CategoryTag(profile: DummyData.sampleProfileDatas[0])
    CategoryTag(profile: DummyData.sampleProfileDatas[0], isDetail: true)
    CategoryTag(profile: DummyData.sampleProfileDatas[3])
    CategoryTag(profile: DummyData.sampleProfileDatas[3], isDetail: true)
    CategoryTag(profile: DummyData.sampleProfileDatas[6])
    CategoryTag(profile: DummyData.sampleProfileDatas[6], isDetail: true)
}
