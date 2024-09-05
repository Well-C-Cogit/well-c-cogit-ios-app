//
//  Constants.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import Foundation

struct Const {
    
    struct Key {
        static let accessToken = "accessToken"
    }
    
    struct Github {
        static let domain = "https://github.com"
        static let apiPath = "https://api.github.com"
        
        static let clientId: String = "Ov23liBmOhUBo16eKz6I"
        static let clientSecret: String = "1a4e75d98399b36d5d7583964491069ebddca5dc"
        static let scope: String = "repo gist user"
        
        struct EndPoint {
            static let login = "/login/oauth/authorize" // 사용자의 깃허브 아이디 (사파리 페이지 이동)
            static let requestAccessToken = "/login/oauth/access_token" // access token 요청
            static let getUser = "/user" // 유저 정보
            static let getRepos = "/user/repos" // 유저 레포지토리 정보
        }
    }
}
