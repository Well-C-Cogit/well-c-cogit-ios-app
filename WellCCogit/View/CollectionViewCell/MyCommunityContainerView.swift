//
//  MyCommunityContainerView.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/11/24.
//

import UIKit

final class MyCommunityContainerView: UIView {
    
    private let userContainerView = UIView()
    private let collectionConatinerView = UIView()
    
    let communityCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: .init())
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 32
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "박지수"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let communityLabel: UILabel = {
        let label = UILabel()
        label.text = "내 모임"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let weeklyCommitLabel: UILabel = {
        let label = UILabel()
        label.text = "금주 커밋"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let totalCommitLabel: UILabel = {
        let label = UILabel()
        label.text = "총 커밋"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let communityCountLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private let weeklyCommitCountLabel: UILabel = {
        let label = UILabel()
        label.text = "26"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private let totalCommitCountLabel: UILabel = {
        let label = UILabel()
        label.text = "435"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "안녕하세요.@@@@@@@@@@@@@@@@@"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUserContainerUI()
        configureCommunitiesUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUserContainerUI() {
       
        userContainerView.backgroundColor = .white
        userContainerView.layer.cornerRadius = 8
        
        addSubview(userContainerView)
        userContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(160)
        }
        
        userContainerView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.size.equalTo(64)
        }
        
        userContainerView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.height.equalTo(16)
        }
        
        userContainerView.addSubview(communityLabel)
        communityLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(userNameLabel.snp.leading)
            make.height.equalTo(12)
        }
        
        userContainerView.addSubview(weeklyCommitLabel)
        weeklyCommitLabel.snp.makeConstraints { make in
            make.leading.equalTo(communityLabel.snp.trailing).offset(8)
            make.centerY.height.equalTo(communityLabel)
        }
        
        userContainerView.addSubview(totalCommitLabel)
        totalCommitLabel.snp.makeConstraints { make in
            make.leading.equalTo(weeklyCommitLabel.snp.trailing).offset(8)
            make.centerY.height.equalTo(communityLabel)
        }
        
        userContainerView.addSubview(communityCountLabel)
        communityCountLabel.snp.makeConstraints { make in
            make.top.equalTo(communityLabel.snp.bottom).offset(8)
            make.centerX.equalTo(communityLabel.snp.centerX)
            make.height.equalTo(8)
        }
        
        userContainerView.addSubview(weeklyCommitCountLabel)
        weeklyCommitCountLabel.snp.makeConstraints { make in
            make.top.equalTo(communityCountLabel)
            make.centerX.equalTo(weeklyCommitLabel)
            make.height.equalTo(8)
        }
        
        userContainerView.addSubview(totalCommitCountLabel)
        totalCommitCountLabel.snp.makeConstraints { make in
            make.top.equalTo(communityCountLabel)
            make.centerX.equalTo(totalCommitLabel)
            make.height.equalTo(8)
        }
        
        userContainerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func configureCommunitiesUI() {
       
        collectionConatinerView.backgroundColor = .white
        collectionConatinerView.layer.masksToBounds = true
        collectionConatinerView.layer.cornerRadius = 8
        
        addSubview(collectionConatinerView)
        collectionConatinerView.snp.makeConstraints { make in
            make.top.equalTo(userContainerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        collectionConatinerView.addSubview(communityCollectionView)
        communityCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureCollectionView() {
        communityCollectionView.register(cellWithClass: CommunityCell.self)
    }
}
