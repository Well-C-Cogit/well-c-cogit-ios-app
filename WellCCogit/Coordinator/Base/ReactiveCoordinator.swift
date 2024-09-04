//
//  ReactiveCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import UIKit
import RxSwift
import RxRelay

class ReactiveCoordinator<ResultType>: BaseCoordinator,
                                       CoordinatorForwardable {
    
    public typealias CoordinatorResultType = ResultType
    
    var forward: PublishRelay<ForwardScene> = PublishRelay<ForwardScene>()

    var currentScene: ForwardScene = .none
    
    var lastScene: ForwardScene = .none
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    deinit {
        self.disposeBag = DisposeBag()
        print("deinit - \(self)")
    }
    
    @discardableResult
    func start(_ type: CoordinatorTransitionType) -> Observable<CoordinatorResultType> {
        fatalError("start() method must be implemented")
    }
    
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>, type: CoordinatorTransitionType, animated: Bool) -> RxSwift.Observable<T> {
        
        self.store(coordinator: coordinator)
        return coordinator.start(type)
            .do(onNext: { [weak self] _ in
                self?.release(coordinator: coordinator)
            })
    }
}
