//
//  AirportService.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 08/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxSwift

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
                    
                    guard let data = resultJson.data else { return }
                    
                    print(type(of: data))
                    do {
                        
                        let allAirports = try JSONDecoder().decode(AirportsResponce.self, from: data)
                        single(.success(allAirports))
                        
                    } catch { print(error) }
                    
                })
                
            } catch {
                print(error)
            }
            
            return Disposables.create()
        }
    }
}
