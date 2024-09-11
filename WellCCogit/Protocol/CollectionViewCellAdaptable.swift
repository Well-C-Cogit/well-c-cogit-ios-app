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

protocol CollectionViewCellAdaptable: CellAdaptable {
   
//    static func adaptFixedSize(model: Decodable, indexPath: IndexPath) -> CGSize
    
//    func adaptComputedSize(model: Decodable, indexPath: IndexPath) -> CGSize
    
//    static func adaptCellSectionInset(model: Decodable, indexPath: IndexPath) -> UIEdgeInsets
//    
//    static func adaptCellInteritemSpacingForSection(model: Decodable, indexPath: IndexPath) -> CGFloat
}
