//
//  HeaderView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("DiverDex")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color("KeyColor"))
                
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
    }
}

#Preview {
    HeaderView()
}
