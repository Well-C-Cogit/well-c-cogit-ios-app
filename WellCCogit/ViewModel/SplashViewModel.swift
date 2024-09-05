//
//  SplashViewModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import RxSwift
import RxRelay

final class SplashViewModel: ViewModelType {
    
    struct Input {
        var transitionToNextScene: PublishRelay<Void>
    }
    
    struct Output { 
        var user: PublishRelay<User?>
    }
   
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
        var goSignIn: PublishRelay<Void>
        var goHome: PublishRelay<Void>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
   
    let input: Input = Input(transitionToNextScene: PublishRelay<Void>())
    
    lazy var output: Output = transform(input)
    
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>(),
                                            goSignIn: PublishRelay<Void>(),
                                            goHome: PublishRelay<Void>())
    let usecase: OAuthUsecase
    
    init(usecase: OAuthUsecase) {
        self.usecase = usecase
    }
    
    func transform(_ input: Input) -> Output {
        let user = PublishRelay<User?>()
        
        input.transitionToNextScene
            .withUnretained(self)
            .flatMap { (self, _) in self.usecase.getUser() }
            .bind(to: user)
            .disposed(by: disposeBag)
    
        user
            .share()
            .withUnretained(self)
            .bind { (self, user) in
                if let user {
                    print("자동 로그인 - \(user)")
                    self.coordinate.goHome.accept(())
                } else {
                    print("로그인 필요")
                    self.coordinate.goSignIn.accept(())
                }
            }
            .disposed(by: disposeBag)
        
        return Output(user: user)
    }
}

