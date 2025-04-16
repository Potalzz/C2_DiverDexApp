//
//  ProfileDetailView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//

import SwiftUI

struct ProfileDetailPageView: View {
    @StateObject private var viewModel = ProfileDetailViewModel()
    private let imageHeight: CGFloat = 250

    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                Image("Velkoz")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .opacity(0.75)

                VStack(spacing: 50) {
                    ProfileDetailCardView(viewModel: viewModel)
                    ProfileInfoView(
                        info: viewModel.profile.info,
                        name: viewModel.profile.info.name,
                        nickname: viewModel.profile.profileCard.nickname)
                    ProfileMemoView(viewModel: viewModel)
                    ProfileAlbumView(albumImages: viewModel.profile.albumImages)
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
    @StateObject var viewModel: ProfileDetailViewModel

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
                        Image(viewModel.profile.profileCard.ProfileImageName)
                            .resizable()
                            .scaledToFit()
                            .padding(7)
                            .position(x: 48, y: 43)
                    }

                Text(viewModel.profile.profileCard.nickname)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)

                Text("#\(viewModel.profile.number)")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding(.bottom, 10)

                CategoryTag(
                    profile: DummyData.sampleProfileDatas[5], isDetail: true)

                Spacer()
            }
            .offset(y: -50)

        }
        .padding(.top, 160)
    }
}

// MARK: - 정보
struct ProfileInfoView: View {
    let info: ProfileDetailInfo
    let name: String
    let nickname: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("⭐️ 정보")
                .font(.system(size: 20))
                .fontWeight(.semibold)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 350)
                    .foregroundStyle(Color.ProfileCardBackground)
                    .shadow(
                        color: Color(.systemGray3), radius: 2, x: 1,
                        y: 2
                    )

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(name)

                        Divider()
                            .frame(height: 20)
                            .padding(.leading, 10)

                        Spacer()

                        Text(nickname)

                    }
                    .font(.system(size: 20))
                    .fontWeight(.semibold)

                    Divider()

                    InfoRowView(title: "이름", value: info.name)
                    InfoRowView(title: "메일", value: info.email)
                    InfoRowView(title: "블로그", value: info.blog)
                    InfoRowView(title: "러너위키", value: info.wiki)
                    InfoRowView(title: "인스타그램", value: info.instagram)
                    InfoRowView(title: "관심사", value: info.interests)
                    InfoRowView(title: "MBTI", value: info.mbti)
                }
                .padding(.horizontal)
            }

        }
        .padding(.horizontal, 46)
    }
}

// MARK: - 메모
struct ProfileMemoView: View {
    @ObservedObject var viewModel: ProfileDetailViewModel
    @State private var showingMemoEditor = false

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
                        showingMemoEditor = true
                    },
                    label: {
                        Image(systemName: "square.and.pencil")
                            .padding(.trailing, 10)
                            .foregroundStyle(.black)
                    })
            }

            RoundedRectangle(cornerRadius: 8)
                .frame(height: 350)
                .foregroundStyle(Color.ProfileCardBackground)
                .shadow(
                    color: Color(.systemGray3), radius: 2, x: 1,
                    y: 2
                )
                .overlay {
                    VStack(alignment: .leading) {
                        if viewModel.memoText.isEmpty {
                            HStack {
                                Text("메모를 작성해주세요.")
                                    .font(.headline)
                                    .fontWeight(.light)
                                    .foregroundStyle(.secondary)
                                    .padding()
                                Spacer()
                            }

                        } else {
                            Text(viewModel.memoText)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        Spacer()
                    }
                }
        }
        .padding(.horizontal, 46)
        .sheet(isPresented: $showingMemoEditor) {
            MemoEditorView(memo: viewModel.memoText) { newMemo in
                viewModel.updateMemo(newMemo)
            }
        }
    }
}

// MARK: - 메모 작성 뷰
struct MemoEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var memoText: String
    let onSave: (String) -> Void

    init(memo: String, onSave: @escaping (String) -> Void) {
        _memoText = State(initialValue: memo)
        self.onSave = onSave
    }

    var body: some View {
        NavigationStack {
            TextEditor(text: $memoText)
                .padding()
                .navigationTitle("메모 작성")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소") {
                            dismiss()
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("저장") {
                            onSave(memoText)
                            dismiss()
                        }
                    }
                }
        }
    }
}

// MARK: - 앨범 뷰
struct ProfileAlbumView: View {
    let albumImages: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("🏞️ 앨범")
                .font(.system(size: 20))
                .fontWeight(.semibold)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color("ProfileCardBackground"))
                    .frame(maxWidth: .infinity)

                AlbumGrid(albumImages: albumImages)
                    .padding()
            }
        }
        .padding(.horizontal, 50)
        Spacer()
    }
}

// MARK: - 앨범 그리드
struct AlbumGrid: View {
    let albumImages: [String]

    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 30, verticalSpacing: 15) {
            ForEach(0..<(albumImages.count + 1) / 2, id: \.self) { rowIndex in
                GridRow {
                    ForEach(0..<2) { coumnIndex in
                        let imageIndex = rowIndex * 2 + coumnIndex
                        if imageIndex < albumImages.count {
                            AlbumImage(imageName: albumImages[imageIndex])
                        } else {
                            // 이미지 추가 버튼
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 148, height: 104)
                                    .foregroundStyle(Color("AddImageBackground"))

                                Image(systemName: "photo.badge.plus")
                                    .font(.system(size: 34))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }

            }
        }
    }
}

// MARK: - 앨범 이미지
struct AlbumImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 148, height: 104)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
