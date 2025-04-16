//
//  ProfileDetailView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileDetailPageView: View {
    private let imageHeight: CGFloat = 250
    @State private var memoText = ""
    let albumImages = ["albumImage-1", "albumImage-2", "albumImage-3"]

    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                Image("Velkoz")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .opacity(0.75)

                VStack(spacing: 50) {
                    ProfileDetailCardView()
                    ProfileInfoView()
                    ProfileMemoView()
                    ProfileAlbumView()
                }
            }
            .background(Color.ProfileDetailViewBackground)
        }

    }
}

#Preview {
    ProfileDetailPageView()
}

// MARK: - 프로필 카드
struct ProfileDetailCardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 360, height: 180)
                    .foregroundStyle(
                        Color("ProfileCardBackground")
                    )
                    .shadow(
                        color: Color(.systemGray3),
                        radius: 2, x: 1, y: 2
                    )

                Image(systemName: "heart")
                    .padding()
            }

            VStack(alignment: .center) {

                Circle()
                    .foregroundStyle(.white)
                    .frame(height: 96)
                    .overlay {
                        Image("profile-1")
                            .resizable()
                            .scaledToFit()
                            .padding(7)
                            .position(x: 48, y: 43)
                    }

                Text("Velko")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)

                Text("#4")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding(.bottom, 10)

                Capsule()
                    .foregroundStyle(
                        Color(
                            "ProfileCardBackground"
                        )
                    )
                    .opacity(0.2)
                    .shadow(
                        color: .black,
                        radius: 1, x: 0.7,
                        y: 0.5
                    )
                    .frame(
                        width: 70, height: 30
                    )
                    .overlay {
                        Text("Tech")
                            .font(.caption)
                            .fontWeight(
                                .semibold
                            )
                            .foregroundStyle(
                                Color(
                                    "KeyColor"))
                    }

                Spacer()
            }
            .offset(y: -50)

        }
        .padding(.top, 160)
    }
}

// MARK: - 정보
struct ProfileInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("⭐️ 정보")
                .font(.system(size: 20))
                .fontWeight(.semibold)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 350)
                    .foregroundStyle(Color("ProfileCardBackground"))
                    .shadow(
                        color: Color(.systemGray3), radius: 2, x: 1,
                        y: 2
                    )

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("김진혁")

                        Divider()
                            .frame(height: 20)
                            .padding(.leading, 10)

                        Spacer()

                        Text("Velko")

                    }
                    .font(.system(size: 20))
                    .fontWeight(.semibold)

                    Divider()
                }.padding(.horizontal)
            }

        }
        .padding(.horizontal, 46)
    }
}

// MARK: - 메모
struct ProfileMemoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("📝 메모")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)

                Spacer()

                Button(
                    action: {
                        // 버튼 눌리면, modal나오고 메모 작성 화면 나오게.

                    },
                    label: {
                        Image(systemName: "square.and.pencil")
                            .padding(.trailing, 10)
                            .foregroundStyle(.black)
                    })
            }

            RoundedRectangle(cornerRadius: 8)
                .frame(height: 350)
                .foregroundStyle(Color("ProfileCardBackground"))
                .shadow(
                    color: Color(.systemGray3), radius: 2, x: 1,
                    y: 2
                )
                .overlay {
                    VStack(alignment: .leading) {
                        //                                        TextField("메모를 작성해주세요.", text: $memoText)
                        HStack {
                            Text("메모를 작성해주세요.")
                                .font(.headline)
                                .fontWeight(.light)
                                .foregroundStyle(.secondary)
                                .padding()
                            Spacer()
                        }

                        Spacer()
                    }

                }
        }
        .padding(.horizontal, 46)
    }
}

// MARK: - 앨범
struct ProfileAlbumView: View {
    let albumImages = ["albumImage-1", "albumImage-2", "albumImage-3"]

    var body: some View {
        VStack(alignment: .leading) {
            Text("🏞️ 앨범")
                .font(.system(size: 20))
                .fontWeight(.semibold)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(
                        Color("ProfileCardBackground")
                    )
                    .frame(maxWidth: .infinity)

                Grid(
                    alignment: .center, horizontalSpacing: 30,
                    verticalSpacing: 15
                ) {
                    // 2개씩 짝지어 행을 생성
                    ForEach(
                        0..<albumImages.count / 2 + 1,
                        id: \.self
                    ) { rowIndex in
                        GridRow {
                            ForEach(0..<2) { columnIndex in
                                let imageIndex =
                                    rowIndex * 2 + columnIndex
                                if imageIndex
                                    < albumImages.count
                                {
                                    Image(
                                        albumImages[imageIndex]
                                    )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        width: 148, height: 104
                                    )
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 8))
                                } else {
                                    // 이미지가 없는 경우 빈 공간 생성
                                    ZStack {
                                        RoundedRectangle(
                                            cornerRadius: 8
                                        )
                                        .frame(
                                            width: 148,
                                            height: 104
                                        )
                                        .foregroundStyle(
                                            Color(
                                                "AddImageBackground"
                                            ))

                                        Image(
                                            systemName:
                                                "photo.badge.plus"
                                        )
                                        .font(.system(size: 34))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.gray)

                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding(.horizontal, 50)
        Spacer()
    }
}
