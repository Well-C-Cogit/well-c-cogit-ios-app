//
//  NetworkService+Rx.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/4/24.
//

import RxSwift
import Alamofire

extension Reactive where Base: NetworkService {
    
    func sendGet(with url: String, parameters: Parameters? = nil) -> Observable<Data?> {
        return Observable.create { [weak base] emitter in
            base?.sendGet(with: url, parameters: parameters, completion: { response in
                switch response.result {
                case .success(let data):
                    emitter.onNext(data)
                    
                case .failure(let error):
                    print("SendGet Response Error - \(error.localizedDescription)")
                    emitter.onNext(nil)
        
                }
                
                emitter.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    func sendGet<T: Decodable>(with url: String, parameters: Parameters? = nil) -> Observable<T?> {
        return Observable.create { [weak base] emitter in
            base?.sendGet(with: url, parameters: parameters) { (result: Result<T, Error>) in
                switch result {
                case .success(let model):
                    emitter.onNext(model)
                    
                case .failure(_):
                    emitter.onNext(nil)
                }
                emitter.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    func sendPost(with url: String, parameters: Parameters?) -> Observable<Data?> {
        return Observable.create { [weak base] emitter in
            base?.sendPost(with: url, parameters: parameters, completion: { res in
                switch res.result {
                case .success(let data):
                    emitter.onNext(data)
                case .failure(let error):
                    print("SendGet Response Error - \(error.localizedDescription)")
                    emitter.onNext(nil)
                }
                
                emitter.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    func sendPost<T: Decodable>(with url: String,
                                parameters: Parameters? = nil,
                                headers: HTTPHeaders? = nil) -> Observable<T?> {
        return Observable.create { [weak base] emitter in
            base?.sendPost(with: url, parameters: parameters, header: headers) { (result: Result<T, Error>) in
                switch result {
                case .success(let model):
                    emitter.onNext(model)
                   
                case .failure(let error):
                    emitter.onNext(nil)
                }
                emitter.onCompleted()
                
            }
            
            return Disposables.create()
        }
    }
}
