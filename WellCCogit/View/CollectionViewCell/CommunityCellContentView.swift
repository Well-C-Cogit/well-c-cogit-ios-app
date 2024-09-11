//
//  CommunityCellContentView.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

final class CommunityCellContentView: UIView {
    private(set) var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.0
        return imageView
    }()
    
    private(set) var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "카페동네 알고리즘 스터디"
        return label
    }()
    
    private(set) var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private(set) var lastCommitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor(hexString: "#d2641b")
        return label
    }()
    
    private(set) var activeMembersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private(set) var daysActiveLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "56일 동안 총 커밋 3,000회를 달성했어요."
        return label
    }()
    
    private(set) var memberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "참여 멤버"
        return label
    }()
//    
//    private var memberCollectionView: UICollectionView = {
//        let collectionView = UICollectionView()
//        return collectionView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(24)
            make.size.equalTo(40)
        }
        
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.height.equalTo(20)
        }
        
        containerView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(16)
        }
        
        containerView.addSubview(lastCommitLabel)
        lastCommitLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationLabel.snp.centerY)
            make.leading.equalTo(locationLabel.snp.trailing).offset(8)
            make.height.equalTo(16)
        }
        
        containerView.addSubview(activeMembersLabel)
        activeMembersLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.leading)
            make.height.equalTo(20)
        }
        
        containerView.addSubview(daysActiveLabel)
        daysActiveLabel.snp.makeConstraints { make in
            make.top.equalTo(activeMembersLabel.snp.bottom).offset(4)
            make.leading.equalTo(activeMembersLabel.snp.leading)
            make.height.equalTo(20)
        }
        
        containerView.addSubview(memberLabel)
        memberLabel.snp.makeConstraints { make in
            make.top.equalTo(daysActiveLabel.snp.bottom).offset(16)
            make.leading.equalTo(imageView.snp.leading)
            make.height.equalTo(20)
        }
        
//        addSubview(memberCollectionView)
//        memberCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(memberLabel.snp.bottom).offset(8)
//            make.leading.equalToSuperview().inset(24)
//            make.bottom.equalToSuperview().inset(32)
//        }
    }
}
