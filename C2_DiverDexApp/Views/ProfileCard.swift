//
//  ProfileCard.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileCardView: View {

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color("ProfileCardBackground"))

            .frame(width: 164, height: 111)
            .shadow(color: Color(.systemGray3), radius: 2, x: 1, y: 1)
            .overlay {
                HStack {
                    VStack {
                        Text("Jack")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Capsule()
                            .foregroundStyle(Color("ProfileCardBackground"))
                            .opacity(0.2)
                            .shadow(color: .black, radius: 1, x: 0.7, y: 0.5)
                            
                            .overlay {
                                Text("Tech")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("KeyColor"))
                            }
                            .frame(width: 50)
                            
                    }
                    .padding(.leading, 15)
                    .padding(.top, 10)

                    Spacer()

                    Image("profile-1")
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .padding(.trailing, 10)
            }

    }
}

#Preview {
    ProfileCardView()
}
