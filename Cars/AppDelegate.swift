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
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let carStorage = CarStorage()
        let driverStorage = DriverStorage()
        let appRouter = AppRouter(navigationController: navigationController)
        let carRouter = CarRouter(appRouter: appRouter, carLoader: carStorage)
        let _ = DriverRouter(appRouter: appRouter, driverLoader: driverStorage)
        let brandRouter = BrandRouter(appRouter: appRouter)
        carRouter.brandRouter = brandRouter
        
        carRouter.showCarsList()
        
        return true
    }

}
