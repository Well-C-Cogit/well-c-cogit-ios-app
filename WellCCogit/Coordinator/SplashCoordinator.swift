//
//  SplashCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import RxSwift

enum SplashCoordinatorResult {
    case goSignIn
    case goHome
    case pop
}

final class SplashCoordinator: ReactiveCoordinator<SplashCoordinatorResult>,
                               CoordinatorTransitable {
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<SplashCoordinatorResult> {
    
        let repository = GithubOAuthRepository()
        let usecase = OAuthUsecase(repository: repository)
        let viewModel = SplashViewModel(usecase: usecase)
        let viewController = SplashViewController(viewModel: viewModel)
       
        let goSignIn = viewModel.coordinate.goSignIn.map { SplashCoordinatorResult.goSignIn }
        let goHome = viewModel.coordinate.goHome.map { SplashCoordinatorResult.goHome }
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
        
        return Observable.merge(goHome,
                                goSignIn)
            .take(1)
            .do { [weak self] _ in
                self?.targetPop(viewController, afterDelay: 0.5)
            }
    }
}


