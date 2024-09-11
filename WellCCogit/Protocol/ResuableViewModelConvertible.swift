//
//  ResuableViewModelConvertible.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/12/24.
//

import UIKit

protocol ResuableViewModelConvertible: Decodable {
    associatedtype classType: UICollectionReusableView
    
    func toVieWModel() -> WellCCogitCellModel
}

extension ResuableViewModelConvertible {
    func toVieWModel() -> WellCCogitCellModel {
        return WellCCogitCellModel(identifier: String(describing: classType.self), model: self)
    }
}
