//
//  User.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation

struct User: Codable {
    var url: String?
    var publicRepos: Int
    var totalPrivateRepos: Int?
   
    var email: String?
    
    var followers: Int
    var following: Int
    
    var company: String?
    var name: String
    var updated: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case url, email, followers, following, company, name
        
        case publicRepos = "public_repos"
        case totalPrivateRepos = "total_private_repos"
        case updated = "updated_at"
        case created = "created_at"
    }
}
