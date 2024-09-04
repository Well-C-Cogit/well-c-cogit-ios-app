//
//  SplashViewController.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit
import RxSwift
import SnapKit

final class SplashViewController: BaseViewController,
                                  ViewModelBindable {
   
    typealias ViewModelType = SplashViewModel
    
    var viewModel: SplashViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Splash VC"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.input.fetchData.accept(())
        }
    }
    
    override func configureUI() {
        self.view.backgroundColor = .green
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
    
    func bindViewModel() {
        self.viewModel.input.fetchData
            .bind(to: self.viewModel.coordinate.goHome)
            .disposed(by: disposeBag)
    }
}

