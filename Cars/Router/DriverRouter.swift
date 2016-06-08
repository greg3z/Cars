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
    let driverLoader: DriverLoader
    
    init(appRouter: AppRouter, driverLoader: DriverLoader) {
        self.appRouter = appRouter
        self.driverLoader = driverLoader
    }
    
    func showDriversList() {
        appRouter.showLoading()
        driverLoader.getDrivers { drivers in
            let driversListController = DriversListController(drivers: drivers)
            self.appRouter.showNext(driversListController)
        }
    }
    
}

protocol DriverLoader {
    
    func getDrivers(callback: [Driver] -> Void)
    
}
