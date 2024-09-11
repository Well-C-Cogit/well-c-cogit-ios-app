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
        
        guard let section = getSection(indexPath.section) else { return UICollectionReusableView() }
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: section.identifier, for: indexPath)
        
        if let adaptableView = reusableView as? ReusableViewAdaptable {
            adaptableView.adaptOnBind(model: section.model, sectionIndex: indexPath.section)
            
            adaptableView.adaptOnUpdate()
        }
        
        return reusableView
    }
    
    func didSelectCell(_ indexPath: IndexPath) {
        guard let cell = self.collectionView.cellForItem(at: indexPath) as? CollectionViewCellAdaptable else { return }
        
        cell.adaptDidSelect(indexPath)
    }
}
