//
//  HttpRouter.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 05/07/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import Alamofire
protocol HttpRouterProtocol {
    var baseUrlString : String { get }
    var path : String { get }
    var method : HTTPMethod { get }
    var headers : HTTPHeaders? { get }
    var parameters : Parameters? { get }
    func body() throws -> Data?
    
    func request(usingHttpServise service : HttpServiceProtocol) throws -> DataRequest
    
}
extension HttpRouterProtocol {
    //these are default valus if nothing is passed
    var parameters : Parameters? { return nil }
    var headers : HTTPHeaders? { return nil }
    func body() throws -> Data? { return nil }
    
    private func asUrlRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }
    
    func request(usingHttpServise service : HttpServiceProtocol) throws -> DataRequest {
        return try service.request(UrlRequest: asUrlRequest())
    }
    
    
}
