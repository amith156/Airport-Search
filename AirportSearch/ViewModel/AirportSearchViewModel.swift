//
//  AirportSearchViewModel.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 28/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation

class AirportSearchViewModel : AirportSearchViewProtocol {
    var input: AirportSearchViewProtocol.Input
    var output: AirportSearchViewProtocol.Output
    
    init(input : AirportSearchViewProtocol.Input) {
        self.input = input
        self.output = AirportSearchViewModel.output(input: self.input)
    }
}

private extension AirportSearchViewModel {
    static func output(input : AirportSearchViewProtocol.Input) -> AirportSearchViewProtocol.Output {
        
        return ()
    }
}
