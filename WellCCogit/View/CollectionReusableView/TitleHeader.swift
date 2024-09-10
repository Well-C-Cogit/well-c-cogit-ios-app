//
//  TitleHeader.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/10/24.
//

import UIKit

final class TitleHeader: UICollectionReusableView {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "타이틀"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
    private func configureUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(16)
            make.height.equalTo(20)
            
        }
    }
}
