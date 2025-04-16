//
//  SearchAndFilterBar.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct SearchView: View {
    @State private var name = ""

    var body: some View {
        VStack(spacing: 12) {
            Capsule()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .shadow(color: Color(.systemGray4), radius: 3)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(.subheadline))
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                        
                        TextField("닉네임을 입력해 주세요.", text: $name)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.system(.headline))
                            .fontWeight(.regular)
                    }
                    .padding()
                }

        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
