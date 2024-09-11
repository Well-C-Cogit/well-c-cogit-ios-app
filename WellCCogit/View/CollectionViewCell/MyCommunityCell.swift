//
//  MyCommunityCell.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit
 
final class MyCommunityCell: BaseCell<MyCommunityModel>, ConfigurableUI {
    
    var baseView: MyCommunityContainerView = MyCommunityContainerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didSelect(model: MyCommunityModel, indexPath: IndexPath) {
        print("MyCommunityCell didSelect called()")
    }
}
