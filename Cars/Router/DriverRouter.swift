//
//  DriverRouter.swift
//  drivers
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DriverRouter {
    
    let appRouter: AppRouter
    var driverStorage: DriverStorage
    
    init(appRouter: AppRouter, driverStorage: DriverStorage) {
        self.appRouter = appRouter
        self.driverStorage = driverStorage
    }
    
    func showDriversList() {
        appRouter.showLoading()
        driverStorage.getElements { drivers in
            self.showDriversList(Array(drivers))
        }
    }
    
    func showDriversList(drivers: [Driver]) {
        let driversListController = DriversListController(drivers: drivers)
        driversListController.driverTouched = {
            driver in
            
        }
        driversListController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add") {
            self.showAddDriver()
        }
//        driversListController.deleteDriver = {
//            self.driverStorage.deleteElement($0)
//        }
        driverStorage.addListener {
            driversListController.drivers = Array(self.driverStorage.elements!)
        }
        appRouter.showNext(driversListController)
    }
    
    func showAddDriver() {
        
    }
    
}
