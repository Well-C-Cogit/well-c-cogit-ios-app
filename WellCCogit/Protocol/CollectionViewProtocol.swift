//
//  CollectionViewProtocol.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit


protocol CollectionViewProtocol: CollectionViewAdaptable {
    
    var handler: CollectionViewHandler! { get set }
    
    func protocolForCollectionView(_ collecitonView: UICollectionView)
}

extension CollectionViewProtocol {
    func protocolForCollectionView(_ collectionView: UICollectionView) {
        if handler == nil { handler = CollectionViewHandler(adaptable: self) }
        collectionView.dataSource = self.handler
        collectionView.delegate = self.handler
    }
}


//MARK: - CollectionViewHandler

class CollectionViewHandler: NSObject {
    public weak var adaptable: CollectionViewAdaptable?
    
    public init(adaptable: CollectionViewAdaptable? ) {
        self.adaptable = adaptable
    }
}

extension CollectionViewHandler: UICollectionViewDataSource,
                                 UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.adaptable?.sectionCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.adaptable?.sectionItemCount(section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.adaptable?.getCell(indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.adaptable?.didSelectCell(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        self.adaptable?.getReusableView(viewForSupplementaryElementOfKind: kind, indexPath) ?? UICollectionReusableView()
    }
}
