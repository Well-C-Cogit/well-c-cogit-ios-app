//
//  AppCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import UIKit
import RxSwift

final class AppCoordinator: ReactiveCoordinator<Void>,
                            CoordinatorTransitable {
   
    static let shared = AppCoordinator(navigationController: UINavigationController())
    
    var viewController: UIViewController?
    var splashCoordinator: Disposable!
    
    var window: UIWindow!
    
    private override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        self.splashCoordinator = self.coordinateToSplash()
            .asObservable()
            .subscribe(onNext: { [weak self] result in
                
            })
    }
}

private extension AppCoordinator {
    func coordinateToSplash() -> Observable<Void> {
        return .just(())
    }
    
    func coordinateToHome() -> Observable<Void> {
        return .just(())
    }
}

