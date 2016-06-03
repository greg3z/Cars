//
//  Router.swift
//  View
//
//  Created by Grégoire Lhotellier on 31/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class Router {
    
    static let sharedInstance = Router()
    var navigationController: UINavigationController?
    
    func showCarsList() {
        startLoading()
        data(0, carsCallback: { cars in
            let carsListController = CarsListController(cars: cars)
            carsListController.carTouched = {
                car in
                self.showCarDetails(car)
            }
            carsListController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add") {
                self.showAddCar()
            }
            self.endLoading(carsListController)
        })
    }
    
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

    func showCarDetails(car: Car) {
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditCar(car)
        }
        showNext(carDetailsController)
    }
    
    func showRandomCarDetails() {
        data(carsCallback: { cars in
            let car = cars[0]
            self.showCarDetails(car)
        })
    }

    func showCarDetails(carId: String) {
        
    }

    func showAddCar() {
        let carFormController = CarFormController(car: nil)
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let car = carFormController.getCar()
            self.showEditCar(car)
        }
        showNext(carFormController)
    }

    func showEditCar(car: Car) {
        let carFormController = CarFormController(car: car)
        showNext(carFormController)
    }

    func showEditCar(carId: String) {
        
    }
    
    func startApp() {
//        showRandomCarDetails()
        showCarsList()
//        showAddCar()
    }
    
    func showNext(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
        
}
