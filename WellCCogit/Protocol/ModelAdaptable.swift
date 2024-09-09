//
//  ModelAdaptable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import Foundation

protocol ModelAdaptable {
    var identifier: String { get set }
    var model: Decodable { get set }
}
