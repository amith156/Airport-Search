//
//  BaseCoordinator.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 29/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation

class BaseCoordinator: CoordinatorProtocol {
    
    var childCoordinator: [CoordinatorProtocol] = []
    
    func start() {
        fatalError("implement childern coordinator.")
    }
    
}
