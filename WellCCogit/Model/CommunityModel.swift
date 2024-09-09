//
//  CommunityModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import Foundation

struct CommunityModel {
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
    typealias cellClassType = CommunityCell
}
