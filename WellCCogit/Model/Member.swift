//
//  Member.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import Foundation

struct Member: Decodable, Hashable {
    var profileImage: String?
    var name: String?
    var userId: String
}

struct MyCommunityModel: Decodable, Hashable {
    var profileImage: String?
    var userId: String
    var name: String
    
    var myCommunities: [CommunityModel]
}

extension MyCommunityModel: CellModelConvertible {
    typealias classType = MyCommunityCell
}
