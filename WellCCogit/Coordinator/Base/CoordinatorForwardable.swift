//
//  CoordinatorForwardable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import RxRelay

public enum ForwardScene {
    case home
    case none
}

protocol CoordinatorForwardable {
    var forward: PublishRelay<ForwardScene> { get set }
    var disposeBag: DisposeBag { get set }
    var currentScene: ForwardScene { get set }
    var lastScene: ForwardScene { get set }
    
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>,
                       type: CoordinatorTransitionType,
                       animated: Bool) -> Observable<T>
        
}
