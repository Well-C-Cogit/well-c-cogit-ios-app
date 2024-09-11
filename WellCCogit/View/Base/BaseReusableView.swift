//
//  BaseReusableView.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/12/24.
//

import UIKit

class BaseReusableView<Model: Decodable>: UICollectionReusableView {
    private var model: Model?
    
    private var sectionIndex: Int?
    
    func update(model: Model) { }
}

extension BaseReusableView: ReusableViewAdaptable {
    func adaptOnBind(model: any Decodable, sectionIndex: Int) {
        self.model = model as? Model
        self.sectionIndex = sectionIndex
    }
    
    func adaptOnUpdate() {
        guard let model else { return }
        
        self.update(model: model)
    }
}
