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

enum HomeSection: Int, Hashable {
    case user
    case bestCommunity
    case otherCommunities
    
    var title: String {
        switch self {
        case .user: return "내 정보"
        case .bestCommunity: return "오늘의 베스트모임"
        case .otherCommunities: return "기타 커뮤니티"
        }
    }
}

enum HomeSectionItem: Hashable {
    case user
    case bestCommunity(CommunityModel)
    case otherCommunities([CommunityModel])
}

final class HomeViewController: BaseViewController,
                                ViewModelBindable {
    
    typealias ViewModelType = HomeViewModel
    
    var viewModel: HomeViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                 collectionViewLayout: .init())
    
    var items: [[WellCCogitCellModel]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarType(.main)
        configureCollectionView()
    }
    
    override func configureUI() {
        view.backgroundColor = UIColor(hexString: "#f5f5f5")
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = createLayout()
        
        collectionView.dataSource = self
        
        collectionView.register(cellWithClass: CommunityCell.self)
        collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withClass: TitleHeader.self)
        
       
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            guard let homeSection = HomeSection(rawValue: sectionIndex) else { return nil }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(160))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .zero

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(180))
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                         repeatingSubitem: item,
                                                         count: self.items?[sectionIndex].count ?? 0)
            
            let section = NSCollectionLayoutSection(group: group)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .estimated(32))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
               
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        
        return layout
    }
    
   
    func bindViewModel() {
        
        viewModel.output.items
            .asDriver(onErrorJustReturn: [[]])
            .drive(onNext: { cellModel in
                guard !cellModel.isEmpty else { return }
                self.items = cellModel
                self.collectionView.reloadData()
            
            })
            .disposed(by: disposeBag)
    }
}

//MARKK: -
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("🟢 Header count \(items?.count)")
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?[section].count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let classType = items?[indexPath.section][indexPath.item].identifier.getClassType() as? UICollectionViewCell.Type else {
            return UICollectionViewCell()
        }
        
        print("ClassType \(classType)")
        
        let cell = collectionView.dequeueReusableCell(withClass: classType.self, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = HomeSection(rawValue: indexPath.section) else { return .init() }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withClass: TitleHeader.self,
                                                                     for: indexPath)
        header.configure(title: section.title)
        return header
    }
}

extension HomeViewController: NavigationConfigurable { }
