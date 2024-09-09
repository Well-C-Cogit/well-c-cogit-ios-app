//
//  HomeViewController.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: BaseViewController,
                                ViewModelBindable {
    
    typealias ViewModelType = HomeViewModel
    
    var viewModel: HomeViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func configureUI() {

        configureNavigationBarType(.main)
        view.backgroundColor = .white

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.register(cellWithClass: CommunityCell.self)
//        collectionView.dataSource = self
        layout.itemSize = CGSize(width: 100, height: 100)
    }
    
   
    func bindViewModel() {
        
        viewModel.output.items
            .bind { cellModels in
                cellModels.forEach { models in
                    print("models - \(models.count)")

                }
            }
            .disposed(by: disposeBag)
        
//        viewModel.output.bestCommunity
//            .bind { bestCommunity in
//                print("BestCommunity - \(bestCommunity)")
//            }
//            .disposed(by: disposeBag)
//        
//        viewModel.output.otherCommunities
//            .bind { otherCommunities in
//                print("OtherCommunities - \(otherCommunities)")
//            }
//            .disposed(by: disposeBag)
    }
}

extension HomeViewController: NavigationConfigurable { }

