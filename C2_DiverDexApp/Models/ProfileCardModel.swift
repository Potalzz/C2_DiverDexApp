//
//  Profile.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileCardModel: Identifiable {
    let id = UUID()
    let name: String
    let category: ProfileCategory
    let ProfileImageName: String

//     샘플 데이터
        static let sampleProfileDatas = [
            ProfileCardModel(name: "Rumy", category: .tech, ProfileImageName: "profile-1"),
            ProfileCardModel(name: "Green", category: .design, ProfileImageName: "profile-2"),
            ProfileCardModel(name: "Zigu", category: .business, ProfileImageName: "profile-3"),
        ]

}
