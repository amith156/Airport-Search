//
//  AirportSearchViewModel.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 28/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class AirportSearchViewModel : AirportSearchViewProtocol {
    var input: AirportSearchViewProtocol.Input
    var output: AirportSearchViewProtocol.Output
    var airportService : AirportService
    
    typealias State = (airports: BehaviorRelay<Set<AirportModel>>, ())
    private let state : State = (airports : BehaviorRelay<Set<AirportModel>> (value: []), ())
    
    private let bag = DisposeBag()
    
    init(input : AirportSearchViewProtocol.Input, airportService : AirportService) {
        self.input = input
        self.output = AirportSearchViewModel.output(input: self.input,
                                                    state: self.state,
                                                    bag: self.bag)
        self.airportService = airportService
        processData()
    }
}

private extension AirportSearchViewModel {
    static func output(input : AirportSearchViewProtocol.Input,
                       state : State,
                       bag : DisposeBag) -> AirportSearchViewProtocol.Output {
        
        let searchTextObservable = input.searchText
            .debounce(.milliseconds(350))
            .distinctUntilChanged()
            .skip(1)
            .asObservable()
            .share(replay: 1, scope: .whileConnected)
        
        let airportStateObservable = state.airports
            .skip(1)
            .asObservable()
        
        searchTextObservable.map({ (val) in
            print("=====> \(val)")
            
        }).subscribe()
            .disposed(by: bag)
        
        Observable
            .combineLatest(searchTextObservable, airportStateObservable)
            .map ({ (searchKey, airportSet) in
                return airportSet.filter { (airport) -> Bool in
                    guard let city = airport.city else { return false }
                    return !searchKey.isEmpty &&
                        city
                            .lowercased()
                            .replacingOccurrences(of: " ", with: "")
                            .hasPrefix(searchKey.lowercased())
                    
                }
            })
            .map{
                print($0,"\n")
            }
            .subscribe()
            .disposed(by: bag)
    }
    
    func processData() {
        airportService
            .fetchAirport()
            .map({ Set($0) })
            .map({ val in
                self.state.airports.accept(val)
            })
            .subscribe()
            .disposed(by: bag)
    }
    
}
