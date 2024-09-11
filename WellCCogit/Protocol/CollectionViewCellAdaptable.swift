//
//  CollectionViewCellAdaptable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit

protocol CellAdaptable {
    func adaptOnBind(model: Decodable, indexPath: IndexPath)
    
    func adaptOnUpdate()
    
    func adaptDidSelect(_ indexPath: IndexPath)
}

protocol CollectionViewCellAdaptable: CellAdaptable { }
