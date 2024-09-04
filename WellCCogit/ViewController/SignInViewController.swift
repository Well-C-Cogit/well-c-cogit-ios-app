//
//  SignInViewController.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SignInViewController: BaseViewController,
                                  ViewModelBindable {
 
    typealias ViewModelType = SignInViewModel
    
    var viewModel: SignInViewModel!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
    
    func bindViewModel() {
        
        signInButton.rx.tap
            .bind(to: viewModel.input.didTapSignInButton)
            .disposed(by: disposeBag)
        
        viewModel.output.signInResult
            .bind { _ in
                
            }
            .disposed(by: disposeBag)
    }
}
