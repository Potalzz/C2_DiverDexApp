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
                        Image(viewModel.profile.profileCard.profileImageName)
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
                    .foregroundStyle(Color.ProfileCardBackground)
                    .shadow(
                        color: Color(.systemGray3), radius: 2, x: 1,
                        y: 2
                    )

                VStack(alignment: .leading, spacing: 20) {
                    Text(nickname)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 20)
                    Divider()

                    TextWithPopup(title: "이름", value: info.name)
                    TextWithPopup(title: "연락처", value: info.number)
                    TextWithPopup(title: "메일", value: info.email)
                    TextWithPopup(title: "블로그", value: info.blog)
                    TextWithPopup(title: "러너위키", value: info.wiki)
                    TextWithPopup(title: "인스타그램", value: info.instagram)
                    TextWithPopup(title: "관심사", value: info.interests)
                    TextWithPopup(title: "MBTI", value: info.mbti)
                }
                .padding(.vertical)
                .padding(.bottom, 10)
            }

        }
        .padding(.horizontal, 50)
    }
}

struct TextWithPopup: View {
    let title: String
    let value: String
    @State private var showPopup = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .frame(width: 100, alignment: .leading)

                Text(value)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    //                    .lineLimit(1)
                    .truncationMode(.tail)
                    .contentShape(Rectangle())
                    .onLongPressGesture {
                        withAnimation {
                            showPopup.toggle()
                        }

                        if showPopup {
                            // 3초 후 자동으로 닫힘
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3)
                            {
                                withAnimation {
                                    showPopup = false
                                }
                            }
                        }
                    }

                Spacer()
            }
            .padding(.horizontal)

            // 팝업을 텍스트 행 바로 아래에 배치
            if showPopup {
                Text(value)
                    .font(.system(size: 14))
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemBackground))
                            .shadow(
                                color: Color(.systemGray3), radius: 3, x: 1,
                                y: 2)
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation {
                            showPopup = false
                        }
                    }
            }
        }
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

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 350)
                    .foregroundStyle(Color.ProfileCardBackground)
                    .shadow(
                        color: Color(.systemGray3), radius: 2, x: 1,
                        y: 2
                    )

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
        .padding(.horizontal, 50)
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

            Button(
                action: {
                    // 버튼 눌렀을 때, 사진 추가할 수 있게.

                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color("ProfileCardBackground"))
                            .frame(maxWidth: .infinity)

                        AlbumGrid(albumImages: albumImages)
                            .padding(.horizontal)
                    }
                })
        }
        .padding(.horizontal, 50)
        Spacer()
    }
}

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
                            // 이미지 꾹 눌렀을 때, 삭제 팝업 나오고 삭제할 수 있도록.

                        } else {
                            // 이미지 추가 버튼
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 148, height: 104)
                                    .foregroundStyle(
                                        Color("AddImageBackground"))

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
