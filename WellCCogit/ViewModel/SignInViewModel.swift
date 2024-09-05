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
        var requestAccessToken: PublishRelay<String>
    }
    
    struct Output {
        var signInResult: PublishRelay<Void>
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var goHome: PublishRelay<Void>
    }
    
    var input: Input = Input(didTapSignInButton: PublishRelay<Void>(),
                             requestAccessToken: PublishRelay<String>())
    
    lazy var output: Output = transform(input)
    
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                            goHome: PublishRelay<Void>())
   
    var disposeBag: DisposeBag = DisposeBag()
    
    var usecase: OAuthUsecase
    
    init(usecase: OAuthUsecase) {
        self.usecase = usecase
    }
    
    func transform(_ input: Input) -> Output {
        let signInResult = PublishRelay<Void>()
        
        input.didTapSignInButton
            .bind { [weak self] in
                self?.usecase.requestCode()
            }
            .disposed(by: disposeBag)
        
        input.requestAccessToken
            .withUnretained(self)
            .flatMap { (self, code) in self.usecase.requestAccessToken(with: code )}
            .bind { accessToken in
                print("AcceesToken - \(accessToken)")
            }
            .disposed(by: disposeBag)
            
        
        return Output(signInResult: signInResult)
    }
}
