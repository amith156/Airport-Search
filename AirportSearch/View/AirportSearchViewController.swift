//
//  ViewController.swift
//  AirportSearch
//
//  Created by Amith Kumar Narayan on 28/06/2020.
//  Copyright © 2020 Narayan inc. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
class AirportSearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var airportSearch: UITextField!
    @IBOutlet weak var roundedView: UIView!
    
    var airportSearchViewModel : AirportSearchViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

