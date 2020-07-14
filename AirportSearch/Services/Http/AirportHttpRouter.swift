//
//  AirportHttpRouter.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 07/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import Alamofire

enum AirportHttpRouter {
    case getAirport
}

extension AirportHttpRouter : HttpRouterProtocol {
    
    var baseUrlString: String {
        "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588"
    }
    
    var path: String {
        switch self {
        case .getAirport:
            return "airports.json"
        }

    }
    
    var method: HTTPMethod {
        switch self {
        case .getAirport:
            return .get
        }
    }
    
}


