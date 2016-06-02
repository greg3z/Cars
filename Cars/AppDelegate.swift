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
        window = UIWindow()
        let navigationController = UINavigationController()
        Router.sharedInstance.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        Router.sharedInstance.startApp()
        return true
    }

}
