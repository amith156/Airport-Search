//
//  AirportSearchCoordinator.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 28/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AirportSearchCoordinator : BaseCoordinator {
    
    private var navigationViewController : UINavigationController
    
    init(navigationViewController : UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    
    override func start() {
        
        let viewController = AirportSearchViewController.instantiate()
        
        //this is a place where the closer of the view is called/passed. so viewModel can be created in viewDidLoad() AirportSearchViewController.
        viewController.viewModelBuilder = {
            AirportSearchViewModel(input: $0)
        }
        
        navigationViewController.pushViewController(viewController.self, animated: true)
        
    }
}
