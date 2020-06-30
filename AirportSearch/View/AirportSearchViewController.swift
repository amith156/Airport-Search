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

class AirportSearchViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var airportSearch: UITextField!
    @IBOutlet weak var roundedView: UIView!
    
    private var airportSearchViewModel : AirportSearchViewProtocol!
    var viewModelBuilder : AirportSearchViewProtocol.ViewModelBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModel is created once the closer is called.
        airportSearchViewModel = viewModelBuilder(
            (searchText : airportSearch.rx.text.orEmpty.asDriver() , ())
        )
        
    }


}

