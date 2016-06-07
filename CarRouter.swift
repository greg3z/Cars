//
//  Router.swift
//  View
//
//  Created by Grégoire Lhotellier on 31/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class CarRouter {
    
    static let sharedInstance = CarRouter()
    
    func showCarsList() {
        AppRouter.sharedInstance.showLoading()
        getCars { cars in
            let carsListController = CarsListController(cars: cars)
            carsListController.carTouched = {
                car in
                self.showCarDrivers(car)
            }
            carsListController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add") {
                self.showAddCar()
            }
            carsListController.imageCallback = {
                car, callback in
                let task = ImageLoader(url: car.image, callback: callback)
                return task
            }
            AppRouter.sharedInstance.showNext(carsListController)
        }
    }

    func showCarDetails(car: Car) {
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditCar(car)
        }
        carDetailsController.brandTouched = { brand in
            BrandRouter.sharedInstance.showBrandDetails(brand)
        }
        carDetailsController.imageCallback = {
            car, callback in
            let _ = ImageLoader(url: car.image, callback: callback)
        }
        AppRouter.sharedInstance.showNext(carDetailsController)
    }
    
    func showCarDrivers(car: Car) {
        let carDriversController = CarDriversController(car: car)
        carDriversController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditCar(car)
        }
        carDriversController.brandTouched = { brand in
            BrandRouter.sharedInstance.showBrandDetails(brand)
        }
        carDriversController.driverTouched = {
            driver in
            
        }
        carDriversController.imageCallback = {
            car, callback in
            let _ = ImageLoader(url: car.image, size: 400, callback: callback)
        }
        AppRouter.sharedInstance.showNext(carDriversController)
    }
    
    func showRandomCarDetails() {
        getCars { cars in
            let car = cars[0]
            self.showCarDetails(car)
        }
    }

    func showCarDetails(carId: String) {
        AppRouter.sharedInstance.showLoading()
        getCar(carId) {
            car in
            self.showCarDetails(car)
        }
    }

    func showAddCar() {
        let carFormController = CarFormController(car: nil)
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let car = carFormController.getCar()
            self.showEditCar(car)
        }
        AppRouter.sharedInstance.showNext(carFormController)
    }

    func showEditCar(car: Car) {
        let carFormController = CarFormController(car: car)
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            carFormController.getCar()
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        AppRouter.sharedInstance.showModal(carFormController)
    }

    func showEditCar(carId: String) {
        
    }
        
}
