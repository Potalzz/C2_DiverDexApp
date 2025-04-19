//
//  MyPageView.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/19/25.
//

import SwiftUI

struct MyPageView: View {

    var body: some View {
        @State var values: String = ""
        @State var nickname: String = ""
        
        ScrollView {
            ZStack(alignment: .top) {
                Color(.profileDetailViewBackground)

                // 이미지 추가 상자
                VStack(alignment: .center) {
                    Image(systemName: "photo.badge.plus")
                        .font(.system(size: 70, weight: .thin))
                        .foregroundStyle(Color(.systemGray3))
                        .padding(.top, 10)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color.myPageImageBackground)
                .padding(.top, 1)

                VStack {
                    MyPageCard()

                    Text("⭐️ 정보")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)

                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color.profileCardBackground)
                            .frame(maxWidth: .infinity)
                            .shadow(
                                color: Color(.systemGray3),
                                radius: 2, x: 1, y: 2
                            )

                        VStack {
                            InfoRowView(title: "이름")
                            InfoRowView(title: "연락처")
                            InfoRowView(title: "메일")
                            InfoRowView(title: "블로그")
                            InfoRowView(title: "러너위키")
                            InfoRowView(title: "인스타그램")
                            InfoRowView(title: "관심사")
                            InfoRowView(title: "MBTI")
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 150)
                }
            }
        }
    }
}

// MARK: - 마이 페이지 프로필 카드
struct MyPageCard: View {
    @State var text = ""
    @State private var selectedCategory: String? = "Tech"
    private let categories = ["Design", "Tech", "Business"]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 360, height: 180)
                .foregroundStyle(
                    Color.profileCardBackground
                )
                .shadow(
                    color: Color(.systemGray3),
                    radius: 2, x: 1, y: 2
                )

            VStack {
                HStack {
                    Text("닉네임")

                    Spacer()

                    TextField("닉네임을 입력해 주세요.", text: $text)
                        .frame(width: 200)
                }

                Divider()

                HStack(spacing: 23) {
                    CategoryButton(
                        title: "Design",
                        color: Color.designText,
                        isSelected: selectedCategory == "Design",
                        action: {
                            selectedCategory = "Design"
                        }
                    )

                    CategoryButton(
                        title: "Tech",
                        color: Color.key,
                        isSelected: selectedCategory == "Tech",
                        action: {
                            selectedCategory = "Tech"
                        }
                    )

                    CategoryButton(
                        title: "Business",
                        color: Color.businessText,
                        isSelected: selectedCategory == "Business",
                        action: {
                            selectedCategory = "Business"
                        }
                    )
                }
                .offset(x: 0, y: 20)
            }
            .padding(.horizontal, 50)

            Circle()
                .frame(height: 96)
                .foregroundStyle(Color.profileIconBackground)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(Color(.systemGray3))
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                }
                .offset(x: 0, y: -95)
        }
        .padding(.top, 140)
        .padding(.bottom, 50)
    }

}

// 카테고리 버튼 컴포넌트
struct CategoryButton: View {
    let title: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(isSelected ? color : .gray)
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            isSelected
                                ? color.opacity(0.1) : Color(.systemGray6))
                )
        }
    }
}

struct InfoRowView: View {
    let title: String
    @State var value: String = ""
    
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 100, alignment: .leading)
                .font(.callout)
            TextField("내용", text: $value)
        }
    }
}




#Preview {
    MyPageView()
}
