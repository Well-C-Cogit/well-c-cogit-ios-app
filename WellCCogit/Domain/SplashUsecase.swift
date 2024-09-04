//
//  SplashUsecase.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation

struct SplashUsecase {
    private let repository: AuthRepositoryType
    
    init(repository: AuthRepositoryType) {
        self.repository = repository
    }
    
    func signIn() {
        self.repository.signIn()
    }
}
