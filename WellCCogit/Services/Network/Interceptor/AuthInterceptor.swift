//
//  AuthInterceptor.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import Alamofire
import KeychainSwift

final class AuthorizationInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        if let accessToken = KeychainSwift().get("accesstoken") {
            request.headers.add(HTTPHeader(name: "Authorization", value: "token \(accessToken)"))
//            request.headers.add(HTTPHeader(name: "Refresh-Token", value: userAuthorization.refreshToken))
        }
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
