//
//  AirportSearchViewProtocol.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 29/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxCocoa

protocol AirportSearchViewProtocol {
    typealias Input = (
        searchText : Driver<String>, ()
    )
    
    typealias Output = ()
    
    typealias ViewModelBuilder = (
        (AirportSearchViewProtocol.Input) -> AirportSearchViewProtocol
    )
    
    
    
    var input : AirportSearchViewProtocol.Input { get }
    var output : AirportSearchViewProtocol.Output { get }
}
