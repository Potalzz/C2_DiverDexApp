//
//  Profile.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileCardModel: Identifiable {
    let id = UUID()
    let nickname: String
    let category: ProfileCategory
    let ProfileImageName: String
}
