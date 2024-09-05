//
//  AuthRepository.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit
import Alamofire
import KeychainSwift
import RxSwift
import RxCocoa

protocol OAuthRepositoryType {
    var domain: String { get }
    var apiPath: String { get }
    
    func requestCode()
    func requestAccessToken(with code: String) -> Observable<String?>
    func getUser() -> Observable<User?>
    
    func logout()
}

protocol GithubRepositoryType: OAuthRepositoryType {
    func getRepos()
}

struct GithubOAuthRepository: GithubRepositoryType {
    
    var domain: String { Const.Github.domain }
    var apiPath: String { Const.Github.apiPath }
    
    
    func requestCode() {
        var components = URLComponents(string: domain + Const.Github.EndPoint.login)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: Const.Github.clientId),
            URLQueryItem(name: "scope", value: Const.Github.scope),
        ]
        
        let urlString: String? = components.url?.absoluteString
        
        if let urlString, let url = URL(string: urlString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func requestAccessToken(with code: String) -> Observable<String?> {
        let parameters = ["client_id": Const.Github.clientId,
                          "client_secret": Const.Github.clientSecret,
                          "code": code]
        
        let url = domain + Const.Github.EndPoint.requestAccessToken
    
        NetworkService.shared.rx.sendPost(with: url, parameters: parameters)
            .bind { data in
                print("data - \(data)")
            }
            
        return .just("a")
        
//        AF.request(url,
//                   method: .post,
//                   parameters: parameters).responseJSON { (response) in
//            switch response.result {
//            case let .success(json):
//                if let dic = json as? [String: String] {
//                    let accessToken = dic["access_token"] ?? ""
//                    KeychainSwift().set(accessToken, forKey: "accessToken")
//                }
//            case let .failure(error):
//                print(error)
//            }
//        }
    }
    
    func getUser() -> Observable<User?> {
        let url = apiPath + Const.Github.EndPoint.getUser
        return NetworkService.shared.rx.sendGet(with: url)
    }
    
    func getRepos() {
        let url = apiPath + Const.Github.EndPoint.getRepos
        
        NetworkService.shared.sendGet(with: url) { (result: Result<String, Error>) in
            switch result {
            case .success(let response):
                print("GetRepos Success \(response)")
            case .failure(let error):
                print("GetRepos Failure \(error.localizedDescription)")
            }
        }
    }
    
    func logout() {
        KeychainSwift().clear()
    }
}
