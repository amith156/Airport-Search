//
//  HttpService.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 07/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpServiceProtocol {  //HttpService base protocol
    var sessionManager : Session { get set }
    func request(UrlRequest : URLRequestConvertible) -> DataRequest
    
}
