//
//  UsersListController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DriversListController: UIViewController {
    
    var drivers: [Driver]
    var driverTouched: (Driver -> Void)?
    
    init(drivers: [Driver]) {
        self.drivers = drivers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let driversListView = ListView(elements: drivers)
        driversListView.configureCell = {
            driver, cell in
            cell.textLabel?.text = driver.name
        }
        driversListView.elementTouched = driverTouched
        addChildView(driversListView)
    }
    
}