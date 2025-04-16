//
//  MockData.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//
struct DummyData {
    static let sampleProfileDatas = [
        ProfileCardModel(
            name: "Rumy", category: .tech, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "Rumy", category: .tech, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "Rumy", category: .tech, ProfileImageName: "profile-1"),

        ProfileCardModel(
            name: "Green", category: .design, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "Green", category: .design, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "Green", category: .design, ProfileImageName: "profile-1"),

        ProfileCardModel(
            name: "Zigu", category: .business, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "iL", category: .business, ProfileImageName: "profile-1"),
        ProfileCardModel(
            name: "Presence", category: .business, ProfileImageName: "profile-1"
        ),
    ]

    static let sampleProfileDetailDatas = [
        ProfileDetailInfo(
            name: "김진혁",
            nickname: "Velko",
            email: "velkozKing@gmail.com",
            blog: "velkoz'slog.velog.com",
            wiki:
                "https://www.notion.so/posacademy/Velko-1b42b843d5af8137b638ec99dd8e52a2?pvs=4",
            instagram: "@ilovevelkoz",
            interests: "벨코즈, 지렁이, 광선, 우주괴물",
            mbti: "INTP"
        )
    ]
}
