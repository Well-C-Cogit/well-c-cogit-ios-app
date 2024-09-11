//
//  ReusableViewAdaptable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/12/24.
//

import Foundation

protocol ReusableViewAdaptable {
    func adaptOnBind(model: Decodable, sectionIndex: Int)
    func adaptOnUpdate()
}
