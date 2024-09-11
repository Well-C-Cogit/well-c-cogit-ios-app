//
//  SplashUsecase.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift

struct OAuthUsecase {
    private let repository: GithubRepositoryType
    
    init(repository: GithubRepositoryType) {
        self.repository = repository
    }
    
    func requestCode() {
        repository.requestCode()
    }
    
    func requestAccessToken(with code: String) -> Observable<OAuthTokenResponse?> {
        return repository.requestAccessToken(with: code)
    }
    
    func getUser() -> Observable<GithubUser?>  {
        return repository.getUser()
    }
    
    func getRepos() {
        repository.getRepos()
    }
    
    func logout() {
        repository.logout()
    }
}
