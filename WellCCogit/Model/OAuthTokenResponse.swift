//
//  OAuthTokenResponse.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import Foundation

enum OAuthTokenType: String, Decodable {
    case guest, bearer
}

struct OAuthTokenResponse: Decodable {
    let tokenType: OAuthTokenType
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
}
