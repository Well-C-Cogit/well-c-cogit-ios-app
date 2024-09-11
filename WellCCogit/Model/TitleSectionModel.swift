//
//  TitleSectionModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/12/24.
//

import Foundation

struct TitleSectionModel {
    var title: String
}

extension TitleSectionModel: ResuableViewModelConvertible {
    typealias classType = TitleHeader
}
