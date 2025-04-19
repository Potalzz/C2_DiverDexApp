//
//  ProfileDetailInfo.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import Foundation

struct ProfileDetailInfo: Identifiable {
    let id = UUID()
    let name: String
    let nickname: String
    let email: String
    let blog: String
    let wiki: String
    let instagram: String
    let interests: String
    let mbti: String
}
