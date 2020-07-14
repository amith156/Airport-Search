//
//  AirportHttpService.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 07/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import Alamofire
class AirportHttpService : HttpServiceProtocol {
    
    var sessionManager: Session = Alamofire.Session.default
    
    func request(UrlRequest urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
