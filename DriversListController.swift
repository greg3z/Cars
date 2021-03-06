//
//  UsersListController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DriversListController: UIViewController {
    
    var drivers: [Driver]{
        didSet {
            driversListView?.elements = drivers
        }
    }
    var driverTouched: (Driver -> Void)?
    var driversListView: ListView<Driver>?
    
    init(drivers: [Driver]) {
        self.drivers = drivers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        driversListView = ListView(elements: drivers, emptyMessage: "No drivers")
        driversListView!.configureCell = {
            driver, cell in
            cell.textLabel?.text = driver.name
        }
        driversListView!.elementTouched = driverTouched
        addChildView(driversListView!)
    }
    
}
