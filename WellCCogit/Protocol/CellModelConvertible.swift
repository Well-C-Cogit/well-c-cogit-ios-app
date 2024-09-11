//
//  CellModelConvertible.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

protocol CellModelConvertible: Decodable {
    associatedtype classType: UICollectionViewCell
    
    func toCellModel() -> WellCCogitCellModel
}

extension CellModelConvertible {
    func toCellModel() -> WellCCogitCellModel {
        return WellCCogitCellModel(identifier: String(describing: classType.self),
                                   model: self)
    }
}
