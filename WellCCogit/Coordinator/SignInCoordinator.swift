//
//  SignInCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift

public enum SignInCoordinatorResult {
    case goHome
}

final class SignInCoordinator: ReactiveCoordinator<SignInCoordinatorResult>,
                               CoordinatorTransitable {
    
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<CoordinatorResultType> {
        
        let repository = GithubOAuthRepository()
        let usecase = OAuthUsecase(repository: repository)
        let viewModel = SignInViewModel(usecase: usecase)
        let viewController = SignInViewController(viewModel: viewModel)
        
        let goHome = viewModel.coordinate.goHome.map { SignInCoordinatorResult.goHome }
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push, animated: false)
        
        return Observable.merge(goHome)
            .take(1)
            .do(onNext: { [weak self] _ in
                self?.targetPop(viewController)
            })
    }
}
