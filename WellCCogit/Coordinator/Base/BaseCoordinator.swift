//
//  BaseCoordinator.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit

class BaseCoordinator {
    let identifier = UUID()
    var childCoordinators = [UUID: BaseCoordinator]()
    
    public var navigationController: UINavigationController
    public var currentViewController: UIViewController {
        if let presented = navigationController.viewControllers.last?.presentedViewController,
           presented.navigationController != nil,
           presented.isBeingDismissed == false {
            return presented
        }
        
        return navigationController.viewControllers.last!
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func store(coordinator: BaseCoordinator) {
        self.childCoordinators[coordinator.identifier] = coordinator
    }
    
    func release(coordinator: BaseCoordinator) {
        self.childCoordinators[coordinator.identifier] = nil
    }
    
    public func removeAll() {
        for child in childCoordinators {
            self.release(coordinator: child.value)
        }
    }
}
