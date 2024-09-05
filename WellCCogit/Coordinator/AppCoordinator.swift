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
                print("result - \(result)")
                self?.handleSplashResult(result: result)
            })
    }
}

//MARK: -
private extension AppCoordinator {
    func coordinateToSplash() -> Observable<SplashCoordinatorResult> {
        let coordinator = SplashCoordinator(navigationController: navigationController)
        return self.coordinate(to: coordinator, type: .push, animated: false)
    }
    
    func coordinateToSignIn() -> Observable<SignInCoordinatorResult> {
        let coordinator = SignInCoordinator(navigationController: navigationController)
        return self.coordinate(to: coordinator, type: .push, animated: false)
    }
    
    func coordinateToHome() -> Observable<Void> {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        return self.coordinate(to: coordinator, type: .push, animated: false)
    }
}

//MARK: -
private extension AppCoordinator {
    func handleSplashResult(result: SplashCoordinatorResult) {
        switch result {
        case .goSignIn:
            self.coordinateToSignIn()
                .subscribe(onNext: { _ in })
                .disposed(by: disposeBag)
            
        case .goHome:
            self.coordinateToHome()
                .subscribe(onNext: { })
                .disposed(by: disposeBag)
            
        case .pop:
            return
        }
    }
}
