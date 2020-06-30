//
//  StoryBoarded.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 29/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "AirportSearch.AirportSearchViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "AirportSearchViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
