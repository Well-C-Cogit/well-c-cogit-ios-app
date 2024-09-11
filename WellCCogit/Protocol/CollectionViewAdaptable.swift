//
//  CollectionViewAdaptable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit

protocol CollectionViewAdaptable: ListAdaptable {
    
    var collectionView: UICollectionView! { get set }
    
    func decorateCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    
    func getCell(_ indexPath: IndexPath) -> UICollectionViewCell
    
    func getReusableView(viewForSupplementaryElementOfKind kind: String,
                         _ indexPath: IndexPath) -> UICollectionReusableView
    
}

extension CollectionViewAdaptable {
    
    func getCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = getItem(indexPath) else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.identifier,
                                                      for: indexPath)
        
        if let adaptCell = cell as? CollectionViewCellAdaptable {
            
            adaptCell.adaptOnBind(model: item.model, indexPath: indexPath)
         
            self.decorateCell(cell, forItemAt: indexPath)
            
            adaptCell.adaptOnUpdate()
        }
        
        return cell
    }
    
    func getReusableView(viewForSupplementaryElementOfKind kind: String,
                         _ indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let identifier = getSectionIdentifier(indexPath.section) else { return UICollectionReusableView() }
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
    }
    
    func didSelectCell(_ indexPath: IndexPath) {
        guard let cell = self.collectionView.cellForItem(at: indexPath) as? CollectionViewCellAdaptable else { return }
        
        cell.adaptDidSelect(indexPath)
    }
}
