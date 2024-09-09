//
//  HomeUsecase.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/9/24.
//

import RxSwift

struct HomeUsecase {
    private let repository: HomeRepositoryType
    
    init(repository: HomeRepositoryType) {
        self.repository = repository
    }
    
    func fetchData() -> Observable<HomeResponse> {
        return repository.fetchData()
    }
}
