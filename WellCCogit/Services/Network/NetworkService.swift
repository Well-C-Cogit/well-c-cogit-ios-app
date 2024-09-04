//
//  NetworkService.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import Alamofire
import RxSwift
import KeychainSwift

public class NetworkServiceRx: NetworkService { }

public class NetworkService {
    static let shared: NetworkService = NetworkService()
    
    private init() { }
    
    private var headers: HTTPHeaders {
        return HTTPHeaders.init([
            HTTPHeader(name: "Content-Type", value: "application/json"),
            HTTPHeader(name: "Accept", value: "application/json")
        ])
    }
    
    func sendGet<T: Decodable>(with url: String,
                               parameters: Parameters? = nil,
                               header: HTTPHeaders? = nil,
                               completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, 
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
    
    func sendPost<T: Decodable>(with url: String,
                                parameters: Parameters?,
                                header: HTTPHeaders? = nil,
                                completion: @escaping (Result<T, Error>) -> Void) {
           AF.request(url,
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
