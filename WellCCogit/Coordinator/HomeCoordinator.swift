//
//  HomeCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import RxSwift

final class HomeCoordinator: ReactiveCoordinator<Void>,
                             CoordinatorTransitable {
    
    override func start(_ type: CoordinatorTransitionType) -> Observable<ReactiveCoordinator<Void>.CoordinatorResultType> {
        
        let viewModel = HomeViewModel()
        
        let viewController = HomeViewController(viewModel: viewModel)
        
        self.transition(to: viewController,
                        navigationController: navigationController,
                        type: .push,
                        animated: false)
        
        return Observable.empty()
    }
}
