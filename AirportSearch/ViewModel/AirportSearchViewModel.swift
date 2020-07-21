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
        self.output = AirportSearchViewModel.output(input: self.input)
        self.airportService = airportService
        processData()
    }
}

private extension AirportSearchViewModel {
    static func output(input : AirportSearchViewProtocol.Input) -> AirportSearchViewProtocol.Output {
        
        return ()
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
