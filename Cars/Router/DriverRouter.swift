//
//  DriverRouter.swift
//  drivers
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class DriverRouter {
    
    let appRouter: AppRouter
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
    func showDriversList() {
        appRouter.showLoading()
        getDrivers { drivers in
            let driversListController = DriversListController(drivers: drivers)
            self.appRouter.showNext(driversListController)
        }
    }
    
}
