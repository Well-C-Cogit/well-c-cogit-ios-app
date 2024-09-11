//
//  HomeRepository.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import RxSwift

protocol HomeRepositoryType {
    func fetchData() -> Observable<HomeResponse>
}

struct HomeRepositoryTest: HomeRepositoryType {
    func fetchData() -> Observable<HomeResponse> {
        return Observable.just(
            HomeResponse(
                user: MyCommunityModel(
                    profileImage: "/images/example1.jpg",
                    userId: "@Jisu0917",
                    name: "박지수",
                    myCommunities: [
                        CommunityModel(progileImage: "/images/WSCG3.png",
                                       name: "카페동네 알고리즘 스터디",
                                       location: "관악구 신림동",
                                       lastCommit: "4분전 활동",
                                       activeMembers: 5,
                                       totalCommit: 648,
                                       daysActive: 88,
                                       members: [
                                        Member(userId: "Jisu0917"),
                                        Member(userId: "Suzy94"),
                                        Member(userId: "Dohyun911")
                                       ])
                    ]),
                
                bestCommunity: CommunityModel(
                    progileImage: "/images/WSCG3.png",
                    name: "카페동네 알고리즘 스터디",
                    location: "관악구 신림동",
                    lastCommit: "2분 전 활동",
                    activeMembers: 6,
                    totalCommit: 3500,
                    daysActive: 88,
                    members: [
                        Member(profileImage: "/images/example.PNG", userId: "Jisu0917"),
                        Member(profileImage: "/images/example1.jpg", userId: "Suzy94"),
                        Member(profileImage: "/images/example2.jpg", userId: "THV1230")
                    ]),
                otherCommunities: [
                    CommunityModel(
                        progileImage: "/images/WSCG2.png",
                        name: "신사동 CS 책 스터디 모임",
                        location: "강남구 신사동",
                        lastCommit: "44분전 활동",
                        activeMembers: 5,
                        totalCommit: 800,
                        daysActive: 23,
                        members: []),
                    CommunityModel(
                        progileImage: "/images/WSCG2.png",
                        name: "신사동 CS 책 스터디 모임",
                        location: "강남구 신사동",
                        lastCommit: "44분전 활동",
                        activeMembers: 5,
                        totalCommit: 800,
                        daysActive: 23,
                        members: []),
                    CommunityModel(
                        progileImage: "/images/WSCG2.png",
                        name: "신사동 CS 책 스터디 모임",
                        location: "강남구 신사동",
                        lastCommit: "44분전 활동",
                        activeMembers: 5,
                        totalCommit: 800,
                        daysActive: 23,
                        members: [])
                ])
        )
    }
}
