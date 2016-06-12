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
            self.showDriverDetails(driver, tab: tab)
        }
        driversListController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add") {
            self.showAddDriver()
        }
        driverStorage.addListener {
            driversListController.drivers = Array(self.driverStorage.elements!)
        }
        appRouter.showNext(driversListController, tab: tab)
    }
    
    func showDriverDetails(driver: Driver, tab: AppRouter.Tab) {
        let driverDetailsController = DriverDetailsController(driver: driver)
        driverDetailsController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditDriver(driver)
        }
        appRouter.showNext(driverDetailsController, tab: tab)
    }
    
    func showEditDriver(driver: Driver) {
        let driverFormController = DriverFormController(driver: driver)
        driverFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let driver = driverFormController.driver
            self.driverStorage.setElement(driver)
            driverFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(driverFormController)
    }
    
    func showAddDriver() {
        
    }
    
}
