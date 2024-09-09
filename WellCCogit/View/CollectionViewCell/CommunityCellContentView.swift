//
//  CommunityCellContentView.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import UIKit

final class CommunityCellContentView: UIView {
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "카페동네 알고리즘 스터디"
        return label
    }()
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text =  "관악구 신림동"
        return label
    }()
    
    private var latestTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "4분전 활동"
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "5명이 활동중인 모임입니다."
        return label
    }()
    
    private var historyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "56일 동안 총 커밋 3,000회를 달성했어요."
        return label
    }()
    
    private var memberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "참여 멤버"
        return label
    }()
    
    private var memberCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private func configureUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(24)
            make.size.equalTo(32)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalTo(imageView.snp.trailing).offset(32)
            make.height.equalTo(20)
        }
        
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.height.equalTo(16)
        }
        
        addSubview(latestTimeLabel)
        latestTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(addressLabel.snp.trailing).offset(4)
            make.centerX.equalTo(addressLabel)
            make.height.equalTo(16)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.leading)
            make.height.equalTo(20)
        }
        
        addSubview(historyLabel)
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(memberLabel.snp.bottom).offset(4)
            make.leading.equalTo(memberLabel.snp.leading)
            make.height.equalTo(20)
        }
        
        addSubview(memberLabel)
        memberLabel.snp.makeConstraints { make in
            make.top.equalTo(historyLabel.snp.bottom).offset(16)
            make.leading.equalTo(imageView.snp.leading)
            make.height.equalTo(20)
        }
        
        addSubview(memberCollectionView)
        memberCollectionView.snp.makeConstraints { make in
            make.top.equalTo(memberLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(32)
        }
    }
}
