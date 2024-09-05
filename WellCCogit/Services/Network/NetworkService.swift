//
//  NetworkService.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Alamofire
import RxSwift
import KeychainSwift

public class NetworkService: NSObject {
    static let shared = NetworkService()
    
    private(set) var session: Session
    
    private override init() { 
        let interceptor = AuthorizationInterceptor()
        self.session = Session(interceptor: interceptor)
    }
    
    private var headers: HTTPHeaders {
        return HTTPHeaders.init([
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Accept", value: "application/json")
        ])
    }
    
    func sendGet(with url: String,
                 parameters: Parameters? = nil,
                 completion: @escaping ((AFDataResponse<Data>) -> Void)) {
        session.request(url,
                        method: .get,
                        parameters: parameters,
                        headers: headers)
        .responseData(completionHandler: completion)
    }
    
    func sendGet<T: Decodable>(with url: String,
                               parameters: Parameters? = nil,
                               header: HTTPHeaders? = nil,
                               completion: @escaping (Result<T, Error>) -> Void) {
        session.request(url,
                   method: .get,
                   parameters: parameters, 
                   headers: headers)
            .responseDecodable(of: T.self) { res in
                switch res.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func sendPost(with url: String,
                 parameters: Parameters? = nil,
                 completion: @escaping ((AFDataResponse<Data>) -> Void)) {
        session.request(url,
                        method: .post,
                        parameters: parameters,
                        encoding: JSONEncoding.default,
                        headers: headers)
        .validate()
        .responseData(completionHandler: completion)
    }
    
    func sendPost<T: Decodable>(with url: String,
                                parameters: Parameters?,
                                header: HTTPHeaders? = nil,
                                completion: @escaping (Result<T, Error>) -> Void) {
        session.request(url,
                        method: .post,
                        parameters: parameters,
                        encoding: JSONEncoding.default,
                        headers: headers)
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
