//
//  CoordinatorTransitable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import UIKit
import RxSwift
import RxCocoa

protocol CoordinatorTransitable {
    func transition(to viewController: UIViewController,
                    navigationController: UINavigationController,
                    type: CoordinatorTransitionType,
                    animated: Bool) -> Observable<Void>
    
    func pop(_ viewController: UIViewController, animated: Bool)
    
    func targetPop(_ viewController: UIViewController?, afterDelay: TimeInterval)
}

extension CoordinatorTransitable {
    @discardableResult
    func transition(to viewController: UIViewController,
                    navigationController: UINavigationController,
                    type: CoordinatorTransitionType,
                    animated: Bool) -> Observable<Void> {
        
        switch type {
        case .root:
            guard let window = navigationController.viewControllers.first?.view.window else {
                fatalError("The UIWindow cannot be found.")
            }
            
            window.rootViewController = viewController
            navigationController.viewControllers.removeAll()
            return Observable.just(())
        case .push:
            let push = navigationController.rx.didShow
                .delaySubscription(.microseconds(500), scheduler: MainScheduler.asyncInstance)
                .filter { _ in
                    guard let _ = navigationController.transitionCoordinator?.viewController(forKey: .from),
                          navigationController.viewControllers.contains(viewController) == false else {
                        return false
                    }
                    return true
                }
                .do { _ in
                    print("UINavigationControllerDelegate.navigationController(_:didShow:animated:)")
                }
                .map { _ in }
            
            navigationController.pushViewController(viewController, animated: animated)
           
            return push
        case .modal:
            guard let presenter = navigationController.viewControllers.last else {
                fatalError("The presenter cannot be found.")
            }
            
            return Observable<Void>.create { emitter in
                
                if viewController.conforms(to: UIViewControllerTransitioningDelegate.self) == false {
                    if viewController.modalPresentationStyle == .pageSheet {
                        viewController.modalPresentationStyle = .fullScreen
                    }
                }
                
                presenter.present(viewController, animated: animated) {
                    emitter.onCompleted()
                }
                
                return Disposables.create()
            }
        }
    }
    
    func pop(_ viewController: UIViewController, animated: Bool) {
        guard viewController.isViewLoaded else { return }
        
        if let presenting = viewController.presentedViewController {
            presenting.dismiss(animated: animated)
            return
        }
        
        guard let navigationController = viewController.navigationController else {
            return
        }
        
        guard navigationController.popViewController(animated: animated) != nil else {
            
            return
        }
    }
    
    func targetPop(_ viewController: UIViewController?, afterDelay: TimeInterval = 0) {
        if afterDelay > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
                self.actionPop(viewController)
            }
        } else {
            self.actionPop(viewController)
        }
    }
    
    private func actionPop(_ viewController: UIViewController?) {
        guard let navigationController = viewController?.navigationController else { return }
        
        var viewControllers = navigationController.viewControllers
              
        var index = 0
        
        for naviViewController in viewControllers {
            if naviViewController == viewController {
                viewControllers.remove(at: index)

                navigationController.viewControllers = viewControllers
                break
            }
            
            index += 1
        }
    }
    
    func dismiss(_ viewController: UIViewController, animtaed: Bool = true, completion: (() -> Void)? = nil) {
        viewController.dismiss(animated: animtaed, completion: completion)
    }
}
