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
    
    func showDriversList(tab: AppRouter.Tab) {
        appRouter.showLoading(tab)
        driverStorage.getElements { drivers in
            self.showDriversList(Array(drivers), tab: tab)
        }
    }
    
    func showDriversList(drivers: [Driver], tab: AppRouter.Tab) {
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
        appRouter.showNext(driversListController, tab: tab)
    }
    
    func showAddDriver() {
        
    }
    
}
