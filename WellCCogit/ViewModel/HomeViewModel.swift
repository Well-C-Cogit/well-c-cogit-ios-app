//
//  HomeViewModel.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/5/24.
//

import RxSwift
import RxRelay

struct HomeResponse: Decodable {
    var user: MyCommunityModel
    var bestCommunity: CommunityModel
    var otherCommunities: [CommunityModel]
}

final class HomeViewModel: ViewModelType {
    
    struct Input: DefaultInput {
        var fetchData: PublishRelay<Void>
    }
    
    struct Output {
        var items: PublishRelay<[ListAdaptable.ListItem]>
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
        var items = PublishRelay<[ListAdaptable.ListItem]>()
       
        input.fetchData
            .withUnretained(self)
            .flatMap { (self, _) in self.useacse.fetchData() }
            .bind { response in
                
                var listItems = [ListAdaptable.ListItem]()
                let headerIdentifier = String(describing: TitleHeader.self)
                listItems.append((TitleSectionModel(title: "내 정보").toVieWModel(),
                                  [response.user.toCellModel()]))
                
                listItems.append((TitleSectionModel(title: "오늘의 베스트 모임").toVieWModel(),
                                  [response.bestCommunity.toCellModel()]))
                
                listItems.append((TitleSectionModel(title: "기타 커뮤니티").toVieWModel(),
                                  response.otherCommunities.map { $0.toCellModel() }))
                
                items.accept(listItems)
            }
            .disposed(by: disposeBag)
        
        return Output(items: items)
    }
}
