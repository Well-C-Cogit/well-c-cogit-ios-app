//
//  ConfigurableUI.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

protocol ConfigurableUI where Self: UIView {
    associatedtype BaseView: UIView
    
    var baseView: BaseView { get set }
    
    func configureBaseView()
}

extension ConfigurableUI {
    func configureBaseView() {
        self.addSubview(self.baseView)
        baseView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
