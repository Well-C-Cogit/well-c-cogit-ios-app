//
//  SignInViewModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import RxRelay

final class SignInViewModel: ViewModelType {
    
    struct Input {
        var didTapSignInButton: PublishRelay<Void>
    }
    
    struct Output {
        var signInResult: PublishRelay<Void>
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var goHome: PublishRelay<Void>
    }
    
    var input: Input = Input(didTapSignInButton: PublishRelay<Void>())
    
    lazy var output: Output = transform(input)
    
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                            goHome: PublishRelay<Void>())
   
    var disposeBag: DisposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let signInResult = PublishRelay<Void>()
        
        input.didTapSignInButton
            .bind { _ in
                LoginManager.shared.requestCode()
            }
            .disposed(by: disposeBag)
        
        signInResult
            .bind { _ in
//                LoginManager.shared.requestCode()
            }
            .disposed(by: disposeBag)
        
        return Output(signInResult: signInResult)
    }
}
