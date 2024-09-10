//
//  HomeViewModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import RxSwift
import RxRelay

struct HomeResponse: Decodable {
    var bestCommunity: CommunityModel
    var otherCommunities: [CommunityModel]
}

final class HomeViewModel: ViewModelType {
    
    struct Input: DefaultInput {
        var fetchData: PublishRelay<Void>
    }
    
    struct Output {
        var items: PublishRelay<[[WellCCogitCellModel]]>
    }
    
    struct Coordinate: DefaultCoordinate {
        var close: PublishRelay<Void>
    }
    
    var input: Input = Input(fetchData: PublishRelay<Void>())
    lazy var output: Output = transform(input)
    var coordinate: Coordinate = Coordinate(close: PublishRelay<Void>())
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let useacse: HomeUsecase
    
    init(usecase: HomeUsecase) {
        self.useacse = usecase
    }
    
    func transform(_ input: Input) -> Output {
        var items = PublishRelay<[[WellCCogitCellModel]]>()
       
        input.fetchData
            .withUnretained(self)
            .flatMap { (self, _) in self.useacse.fetchData() }
            .bind { response in
                
                var cellModel = [[WellCCogitCellModel]]()
                
                cellModel.append([response.bestCommunity.toCellModel()])
                cellModel.append(response.otherCommunities.map { $0.toCellModel() })
                
                items.accept(cellModel)
            }
            .disposed(by: disposeBag)
        
        return Output(items: items)
    }
}
