//
//  AirportApiProtocol.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 08/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxSwift

protocol AirportApiProtocol {
    func fetchAirport() -> Single<AirportsResponce>
}
