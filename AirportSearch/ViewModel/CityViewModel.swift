//
//  CityViewModel.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 14/08/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation

struct CityViewModel : CityViewModelProtocol {
    
    var city: String
    var location: String
    
}
extension CityViewModel {
    
    init(model : AirportModel) {
//        guard let city = model.city else { return }
        self.city = model.city!
        self.location = model.state!
    }
}
