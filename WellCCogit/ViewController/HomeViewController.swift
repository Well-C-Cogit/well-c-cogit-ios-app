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
                                ViewModelBindable,
                                CollectionViewProtocol {
    
    typealias ViewModelType = HomeViewModel
    var viewModel: HomeViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    lazy var handler: CollectionViewHandler! = CollectionViewHandler(adaptable: self)

    var collectionView: UICollectionView! = UICollectionView(frame: .zero,
                                                                 collectionViewLayout: .init())
    
    var items: [ListItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        protocolForCollectionView(collectionView)
        configureNavigationBarType(.main)
        configureCollectionView()
    }

    func decorateCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) { }
    
    func bindViewModel() {
        
        viewModel.output.items
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { items in
                guard !items.isEmpty else { return }
                
                self.items = items
                
                self.collectionView.reloadData()
            
            })
            .disposed(by: disposeBag)
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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = createLayout()

        collectionView.register(cellWithClass: MyCommunityCell.self)
        collectionView.register(cellWithClass: CommunityCell.self)
        collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withClass: TitleHeader.self)
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            guard let homeSection = HomeSection(rawValue: sectionIndex) else { return nil }
            
            switch homeSection {
            case .user:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(400))
                
                var item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(400))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                               subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .estimated(40))
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                   
                section.boundarySupplementaryItems = [header]
                
                return section
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(160))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(160))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                             repeatingSubitem: item,
                                                             count: self.items?[sectionIndex].items.count ?? 0)
                
                group.interItemSpacing = .fixed(16)
       
                let section = NSCollectionLayoutSection(group: group)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .estimated(40))
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                   
                section.boundarySupplementaryItems = [header]
                
                return section
            }
        }
        
        return layout
    }
}

extension HomeViewController: NavigationConfigurable { }
