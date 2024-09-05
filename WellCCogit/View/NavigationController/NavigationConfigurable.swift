//
//  NavigationConfigurable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/6/24.
//

import UIKit

enum NavigationType {
    case main
}

protocol NavigationConfigurable: NavigationDataSource, NavigationDelegate { }
protocol NavigationDataSource where Self: UIViewController { }
protocol NavigationDelegate where Self: ViewModelBindable { }

extension NavigationConfigurable {
    var enabled: Bool { return navigationController is WellCCogitNavigationController }

    func configureNavigationBarType(_ type: NavigationType) {
        guard enabled else { return }
        
        switch type {
        case .main:
            let leftBarImage = #imageLiteral(resourceName: "Logo").withRenderingMode(.alwaysOriginal)
            let leftBarImageView = UIImageView(image: leftBarImage.resizeImage(size: CGSize(width: 32, height: 32)))
            let leftBarButtonItem = UIBarButtonItem(customView: leftBarImageView)
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
           
            let centerImage = #imageLiteral(resourceName: "TitleLogo").withRenderingMode(.alwaysOriginal)
            let centerImageView = UIImageView(image: centerImage.resizeImage(size: CGSize(width: 96, height: 24)))
            self.navigationItem.titleView = centerImageView
        }
    }
}
