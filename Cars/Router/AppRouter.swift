//
//  AppRouter.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class AppRouter {
    
    let tabbarController: UITabBarController
    let carsNavigationController: UINavigationController
    let driversNavigationController: UINavigationController
    var loadingScreen: [Tab: Bool] = [.Cars: false, .Drivers: false]
    
    enum Tab: String {
        case Cars, Drivers
    }
    
    init(tabbarController: UITabBarController) {
        self.tabbarController = tabbarController
        carsNavigationController = UINavigationController()
        carsNavigationController.tabBarItem = UITabBarItem(title: Tab.Cars.rawValue, image: nil, selectedImage: nil)
        driversNavigationController = UINavigationController()
        driversNavigationController.tabBarItem = UITabBarItem(title: Tab.Drivers.rawValue, image: nil, selectedImage: nil)
        tabbarController.setViewControllers([carsNavigationController, driversNavigationController], animated: true)
    }
    
    func showNext(viewController: UIViewController, tab: Tab, animated: Bool = true) {
        let navigationController: UINavigationController
        switch tab {
        case .Cars: navigationController = carsNavigationController
        case .Drivers: navigationController = driversNavigationController
        }
        var animated = animated
        if loadingScreen[tab]! {
            loadingScreen[tab] = false
            animated = false
            if navigationController.viewControllers.count == 1 {
                navigationController.viewControllers = []
            }
            else {
                navigationController.popViewControllerAnimated(false)
            }
        }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func showModal(viewController: UIViewController) {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel") {
            navController.dismissViewControllerAnimated(true, completion: nil)
        }
        tabbarController.presentViewController(navController, animated: true, completion: nil)
    }
    
    func showLoading(tab: Tab) {
        let loadingView = LoadingView()
        showNext(loadingView, tab: tab)
        loadingScreen[tab] = true
    }
    
}
