//
//  CordinatorProtocol.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 29/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
protocol CoordinatorProtocol :  class {
    
    var childCoordinator : [CoordinatorProtocol] { get set }
    
    func start()
}
extension CoordinatorProtocol {
    
    func add(coordinator: CoordinatorProtocol) -> Void {
        self.childCoordinator.append(coordinator)
    }
    
    func remove(coordinator: CoordinatorProtocol) -> Void {
        self.childCoordinator.filter{ $0 !== coordinator}
    }
}
