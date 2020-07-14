//
//  AirportService.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 08/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class AirportService {
    
    static let shared : AirportService = AirportService()
    private lazy var httpService = AirportHttpService()
    
}

extension AirportService : AirportApiProtocol {
    
    func fetchAirport() -> Single<AirportsResponce> {
        return Single.create { [httpService] (single) -> Disposable in
            
            do{
                try AirportHttpRouter.getAirport
                    .request(usingHttpServise: httpService)
                .responseJSON(completionHandler: { (resultJson) in
                    
                    do {
                        let allAirports = try AirportService.parseAirport(result: resultJson)
                        single(.success(allAirports!))
                    } catch {
                        single(.error(error))
                    }
                })
            } catch {
                single(.error(error))
            }
            
            return Disposables.create()
        }
    }
}

extension AirportService {
    
    static func parseAirport(result : AFDataResponse<Any>) throws -> AirportsResponce? {
        
        guard
            let data = result.data,
            let allAirports = try? JSONDecoder().decode(AirportsResponce.self, from: data)
            else {
                throw CustomError.error(message: "Invalid Airports JSON")
        }
        
        return allAirports
    }
}
