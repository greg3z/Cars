//
//  DriverRouter.swift
//  drivers
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class DriverRouter {
    
    static let sharedInstance = DriverRouter()
    
    func showDriversList() {
        AppRouter.sharedInstance.showLoading()
        getDrivers { drivers in
            let driversListController = DriversListController(drivers: drivers)
            AppRouter.sharedInstance.showNext(driversListController)
        }
    }
    
}
