//
//  AppRouter.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class AppRouter {
    
    static let sharedInstance = AppRouter()
    var navigationController: UINavigationController?
    
    func startLoading() {
        let loadingView = LoadingView()
        showNext(loadingView)
    }
    
    func endLoading(viewController: UIViewController) {
        if navigationController?.viewControllers.count == 1 {
            navigationController?.viewControllers = []
        }
        else {
            navigationController?.popViewControllerAnimated(false)
        }
        showNext(viewController, animated: false)
    }
    
    func startApp() {
        //        showRandomCarDetails()
        CarRouter.sharedInstance.showCarsList()
        //        showAddCar()
    }
    
    func showNext(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func showModal(viewController: UIViewController) {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel") {
            navController.dismissViewControllerAnimated(true, completion: nil)
        }
        navigationController?.visibleViewController?.presentViewController(navController, animated: true, completion: nil)
    }
    
}
