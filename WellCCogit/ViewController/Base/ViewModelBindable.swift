//
//  ViewModelBindable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit
import RxSwift

protocol ViewModelBindable {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    var shouldFetchData: Bool { get }
    var disposeBag: DisposeBag { get set }
    
    func bindViewModel()
    
    init(viewModel: ViewModelType)
}

// MARK: -
extension ViewModelBindable where Self: UIViewController {
    
    var shouldFetchData: Bool { return true }
    
    init(viewModel: ViewModelType) {
        self.init()
        
        self.viewModel = viewModel

        bindViewModel()
    }
}

