//
//  ProfileCategory.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

enum ProfileCategory: String, CaseIterable {
    case tech = "Tech"
    case design = "Design"
    case business = "Business"
    
    var color: Color {
        switch self {
        case .tech:
            return Color.KeyColor
        case .design:
            return Color.DesignText
        case .business:
            return Color.BusinessText
        }
    }
    
    var boxSize: CGFloat {
        switch self {
        case .tech:
            return 50
        case .design:
            return 60
        case .business:
            return 70
        }
    }
}
