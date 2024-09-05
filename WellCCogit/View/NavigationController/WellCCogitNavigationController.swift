//
//  WellCCogitNavigationController.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/6/24.
//

import UIKit

class WellCCogitNavigationController: UINavigationController { }

extension WellCCogitNavigationController: UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white
        
        interactivePopGestureRecognizer?.delegate = self
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
