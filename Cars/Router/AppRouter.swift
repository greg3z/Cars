//
//  AppRouter.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class AppRouter {
    
    var navigationController: UINavigationController
    var loadingScreen = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showNext(viewController: UIViewController, animated: Bool = true) {
        var animated = animated
        if loadingScreen {
            loadingScreen = false
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
        navigationController.visibleViewController?.presentViewController(navController, animated: true, completion: nil)
    }
    
    func showLoading() {
        let loadingView = LoadingView()
        showNext(loadingView)
        loadingScreen = true
    }
    
}
