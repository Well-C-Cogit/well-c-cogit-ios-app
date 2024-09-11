//
//  CommunityModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import Foundation

struct CommunityModel: Decodable, Hashable {
    static func == (lhs: CommunityModel, rhs: CommunityModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    var progileImage: String?
    var name: String
    var location: String
    var lastCommit: String
    var activeMembers: Int
    var totalCommit: Int
    var daysActive: Int
    var members: [Member]
}

extension CommunityModel: CellModelConvertible {
    typealias classType = CommunityCell
}
