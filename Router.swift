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
        let loadingView = LoadingView()
        showNext(loadingView)
        data(2, carsCallback: { cars in
            let carsListController = CarsListController(cars: cars)
            carsListController.carTouched = {
                car in
                self.showCarDetails(car)
            }
            loadingView.addChildView(carsListController)
        })
        loadingView.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add") {
            self.showAddCar()
        }
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
    
    func showNext(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
        
}
