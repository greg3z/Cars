//
//  AppDelegate.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        initData()
        window = UIWindow()
        let tabbarController = UITabBarController()
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        let carStorage = CarStorage()
        let driverStorage = DriverStorage()
        let appRouter = AppRouter(tabbarController: tabbarController)
        let carRouter = CarRouter(appRouter: appRouter, carStorage: carStorage)
        let driverRouter = DriverRouter(appRouter: appRouter, driverStorage: driverStorage)
        let brandRouter = BrandRouter(appRouter: appRouter)
        carRouter.brandRouter = brandRouter
        
        carRouter.showCarsList(.Cars)
        driverRouter.showDriversList(.Drivers)
        
        return true
    }

}
