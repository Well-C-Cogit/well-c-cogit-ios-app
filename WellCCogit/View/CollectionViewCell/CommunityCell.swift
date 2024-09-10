//
//  CommunityCell.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

class BaseCell<Model: Decodable>: UICollectionViewCell {
    
    public var model: Model?
    
    public var indexPath: IndexPath?
    
    func update(model: Model) { }
    
    func didSelect(model: Model, indexPath: IndexPath) { }
}

class CommunityCell: BaseCell<CommunityModel>, ConfigurableUI {
    var baseView: CommunityCellContentView = CommunityCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
