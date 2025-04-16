//
//  +View.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/15/25.
//

import SwiftUI

extension View {
    func hideKeyboardWhenTappedAround() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder), to: nil, from: nil,
                for: nil)
        }
    }
}
