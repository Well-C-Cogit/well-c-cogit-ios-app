//
//  UICollectionView+Extensions.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

extension UICollectionView {
    public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        let identifier = String(describing: name)
        print("Register \(identifier)")
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: name)
        print("Dequeue \(identifier)")
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else { fatalError("Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        
        return cell
    }
}
