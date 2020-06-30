//
//  WindowCoordinator.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 29/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import UIKit

class WindowCordinator: BaseCoordinator {
    
    private let window : UIWindow
    private let navigationViewController : UINavigationController = {
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true
        return navigation
    }()
    
    init(window : UIWindow) {
        self.window = window
    }
    
    override func start() {
        let airportSerachCoordinator = AirportSearchCoordinator(navigationViewController: navigationViewController)
        self.add(coordinator: airportSerachCoordinator)
        
        airportSerachCoordinator.start()
        
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
