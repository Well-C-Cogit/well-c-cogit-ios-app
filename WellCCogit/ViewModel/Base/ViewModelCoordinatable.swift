//
//  ViewModelCoordinatable.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import RxRelay

protocol ViewModelCoordinatable: DefaultCoordinatable {
    associatedtype Coordinate: DefaultCoordinate
    
    var coordinate: Coordinate { get set }
}

protocol DefaultCoordinatable {
    var coordinate: DefaultCoordinate { get }
}

protocol DefaultCoordinate {
    var close: PublishRelay<Void> { get set }
}
