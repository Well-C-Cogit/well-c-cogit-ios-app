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
    
    override func configureUI() {
        configureNavigationBarType(.main)
        view.backgroundColor = .gray
    }
    
    func bindViewModel() {
        
    }
}

extension HomeViewController: NavigationConfigurable { }
