//
//  LoginManager.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Foundation
import UIKit
import Alamofire
import KeychainSwift

final class LoginManager {
    static let shared = LoginManager()
    
    private init() { }
    
    private let clientId: String = "Ov23liBmOhUBo16eKz6I"
    private let clientSecret: String = "1a4e75d98399b36d5d7583964491069ebddca5dc"
    private let scope: String = "repo gist user"
    private let githubURL: String = "https://github.com"
    private let githubApiURL: String = "https://api.github.com"
    
    func requestCode() {
        var components = URLComponents(string: githubURL + ApiPath.Github.LOGIN.rawValue)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: self.clientId),
            URLQueryItem(name: "scope", value: self.scope),
        ]
        
        let urlString: String? = components.url?.absoluteString
        
        if let urlString, let url = URL(string: urlString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func requestAccessToken(with code: String) {
              let parameters = ["client_id": clientId,
                                "client_secret": clientSecret,
                                "code": code]
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(githubURL + ApiPath.Github.ACCESS_TOKEN.rawValue,
                   method: .post, parameters: parameters,
                   headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let dic = json as? [String: String] {
                    let accessToken = dic["access_token"] ?? ""
                    KeychainSwift().set(accessToken, forKey: "accessToken")
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
      func getUser() {
          let accessToken = KeychainSwift().get("accessToken") ?? ""
          let headers: HTTPHeaders = ["Accept": "application/vnd.github.v3+json",
                                      "Authorization": "token \(accessToken)"]

          AF.request(githubApiURL + ApiPath.Github.USER.rawValue,
                     method: .get,
                     parameters: [:],
                     headers: headers)
          .responseDecodable(of: User.self) { res in
              switch res.result {
              case .success(let user):
                  print("User - \(user)")
              case .failure(let error):
                  print("Error - \(error.localizedDescription)")
              }
          }
      }
      
      func getRepos() {
          let accessToken = KeychainSwift().get("accessToken") ?? ""
          let headers: HTTPHeaders = ["Accept": "application/vnd.github.v3+json",
                                      "Authorization": "token \(accessToken)"]
          AF.request(githubApiURL + ApiPath.Github.REPOS.rawValue,
                     method: .get, parameters: [:],
                     headers: headers).responseJSON(completionHandler: { (response) in
                          switch response.result {
                          case .success(let json):
                              print(json)
                          case .failure:
                              print("")
                          }
                     })
      }
      
      func logout() {
          KeychainSwift().clear()
      }
}
