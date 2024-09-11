//
//  CommunityCell.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

class CommunityCell: BaseCell<CommunityModel>, ConfigurableUI {
    
    var baseView: CommunityCellContentView = CommunityCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(model: CommunityModel) {
        baseView.nameLabel.text = model.name
        baseView.lastCommitLabel.text = model.lastCommit
        baseView.locationLabel.text = model.location
        baseView.activeMembersLabel.text = "\(model.activeMembers)명이 활동중인 모임이에요."
        baseView.daysActiveLabel.text = "\(model.daysActive)일 동안 총 커밋 \(model.totalCommit)회를 달성했어요!"
    }
    
    override func didSelect(model: CommunityModel, indexPath: IndexPath) {
        print("didSelect \(model.name)")
    }
}
