//
//  ProfileDetailViewModel.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import Foundation
import SwiftUI
import Combine

class ProfileDetailViewModel: ObservableObject {
    @Published var profile: ProfileModel
    @Published var isLiked: Bool = false
    @Published var memoText: String = ""
    
    init(profile: ProfileModel = DummyData.sampleProfilDetailModel) {
        self.profile = profile
        self.memoText = profile.memo
    }
    
    func toggleLike() {
        isLiked.toggle()
    }
    
    func updateMemo(_ newMemo: String) {
        memoText = newMemo
    }
}
