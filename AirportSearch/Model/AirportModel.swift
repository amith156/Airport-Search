//
//  AirportModel.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 08/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation

//struct AirportResponce : Codable {
//    let data : [AirportModel]
//}

typealias AirportsResponce = [AirportModel]

// MARK: - AirportsResponceElement

struct AirportModel: Codable {
    let code, lat, lon, name: String?
    let city, state, country, woeid: String?
    let tz, phone, type, email: String?
    let url, runwayLength, elev, icao: String?
    let directFlights, carriers: String?

    enum CodingKeys: String, CodingKey {
        case code, lat, lon, name, city, state, country, woeid, tz, phone, type, email, url
        case runwayLength = "runway_length"
        case elev, icao
        case directFlights = "direct_flights"
        case carriers
    }
}

extension AirportModel : Equatable {
    
    static func == (lhs : AirportModel, rhs : AirportModel) -> Bool {
        return lhs.code == rhs.code
    }

}

extension AirportModel : Hashable {
    
    func hash(into hasher : inout Hasher) {
        hasher.combine(code)
    }
}
