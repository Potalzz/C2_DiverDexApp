//
//  MockData.swift
//  C2_DiverDexApp
//
//  Created by PenguinLand on 4/16/25.
//
struct DummyData {
    static let sampleProfileDatas = [
        ProfileCardModel(
            nickname: "Rumy", category: .tech, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "Rumy", category: .tech, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "Rumy", category: .tech, ProfileImageName: "profile-1"),

        ProfileCardModel(
            nickname: "Green", category: .design, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "Green", category: .design, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "Green", category: .design, ProfileImageName: "profile-1"),

        ProfileCardModel(
            nickname: "Zigu", category: .business, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "iL", category: .business, ProfileImageName: "profile-1"),
        ProfileCardModel(
            nickname: "Presence", category: .business, ProfileImageName: "profile-1"
        ),
    ]

    static let sampleProfileDetailInfoDatas = [
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

    static let sampleProfilDetailModel = ProfileModel(
        profileCard: ProfileCardModel(
            nickname: "Velko",
            category: .tech,
            ProfileImageName: "profile-1"
        ),
        number: 4,
        info: sampleProfileDetailInfoDatas[0],
        memo: "",
        albumImages: ["albumImage-1", "albumImage-2", "albumImage-3"],
        backgroundImage: "Velkoz"
    )
}
