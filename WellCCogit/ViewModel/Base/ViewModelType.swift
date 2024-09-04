//
//  ViewModelType.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift

protocol ViewModelType: InputOutputAttachable,
                        ViewModelCoordinatable {
    var disposeBag: DisposeBag { get }
}
