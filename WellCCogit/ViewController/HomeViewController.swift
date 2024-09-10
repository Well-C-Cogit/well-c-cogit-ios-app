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
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width, height: 200)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        return layout
    }()

    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                 collectionViewLayout: layout)
    
    var items: [[WellCCogitCellModel]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func configureUI() {
        configureNavigationBarType(.main)
        view.backgroundColor = .white

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureCollectionView() {
        collectionView.register(cellWithClass: CommunityCell.self)
        collectionView.dataSource = self
    }
    
   
    func bindViewModel() {
        
        viewModel.output.items
            .asDriver(onErrorJustReturn: [[]])
            .do(onNext: { _ in self.collectionView.layoutIfNeeded() })
            .drive(onNext: { cellModel in
                guard !cellModel.isEmpty else { return }
                self.items = cellModel
                self.collectionView.reloadData()
            
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: NavigationConfigurable { }
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?[section].count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CommunityCell.self, for: indexPath)
        return cell
    }
}
