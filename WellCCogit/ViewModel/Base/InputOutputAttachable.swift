//
//  InputOutputAttachable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import RxRelay

protocol InputOutputAttachable {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    
    func transform(_ input: Input) -> Output
}

protocol DefaultInput {
    var fetchData: PublishRelay<Void> { get set }
}
