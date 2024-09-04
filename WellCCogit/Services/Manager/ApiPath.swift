//
//  ApiPath.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation

enum ApiPath {
    
    enum Github: String {
        case LOGIN = "/login/oauth/authorize" // 사용자의 깃허브 아이디 (사파리 페이지 이동)
        case ACCESS_TOKEN = "/login/oauth/access_token" // access token 요청
        case USER = "/user" // 유저 정보
        case REPOS = "/user/repos" // 유저 레포지토리 정보
    }
}
