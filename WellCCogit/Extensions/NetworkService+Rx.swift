//
//  NetworkService+Rx.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import Alamofire

extension Reactive where Base: NetworkService {
    
    func sendGet<T: Decodable>(with url: String,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil) -> Observable<T> {
        return Observable.create { [weak base] emitter in
            base?.sendGet(with: url, parameters: parameters, header: headers) { (result: Result<T, Error>) in
                switch result {
                case .success(let model):
                    emitter.onNext(model)
                    emitter.onCompleted()
                    
                case .failure(let error):
                    emitter.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func sendPost<T: Decodable>(with url: String,
                                parameters: Parameters? = nil,
                                headers: HTTPHeaders? = nil) -> Observable<T> {
        return Observable.create { [weak base] emitter in
            base?.sendPost(with: url, parameters: parameters, header: headers) { (result: Result<T, Error>) in
                switch result {
                case .success(let model):
                    emitter.onNext(model)
                    emitter.onCompleted()
                    
                case .failure(let error):
                    emitter.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
