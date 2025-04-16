//
//  ProfileCard.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileCardView: View {
    let model: ProfileCardModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color("ProfileCardBackground"))
                .frame(width: 164, height: 111)
                .shadow(color: Color(.systemGray3), radius: 2, x: 1, y: 1)

            HStack {
                VStack(alignment: .center) {
                    Text(model.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: 60)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                    ZStack {
                        Capsule()
                            .foregroundStyle(Color("ProfileCardBackground"))
                            .opacity(0.2)
                            .shadow(color: .black, radius: 1, x: 0.7, y: 0.5)
                            .frame(width: model.category.boxSize, height: 20)
                        Text(model.category.rawValue)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(model.category.color))
                    }
                }
                .padding(.leading, 10)
                
                Image(model.ProfileImageName)
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
    HomeView()
}
