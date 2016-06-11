//
//  Router.swift
//  View
//
//  Created by Grégoire Lhotellier on 31/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarRouter {
    
    let appRouter: AppRouter
    var brandRouter: BrandRouter!
    let carLoader: CarLoader
    
    init(appRouter: AppRouter, carLoader: CarLoader) {
        self.appRouter = appRouter
        self.carLoader = carLoader
    }
    
    func showCarsList() {
        appRouter.showLoading()
        carLoader.getCars { cars in
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
                if let image = car.image {
                    let task = ImageLoader(url: image, callback: callback)
                    return task
                }
                return nil
            }
            self.carLoader.addListener {
                carsListController.cars = Array(self.carLoader.cars!)
            }
            self.appRouter.showNext(carsListController)
        }
    }

    func showCarDetails(car: Car) {
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditCar(car)
        }
        carDetailsController.brandTouched = { brand in
            self.brandRouter.showBrandDetails(brand)
        }
        carDetailsController.imageCallback = {
            car, callback in
            if let image = car.image {
                let _ = ImageLoader(url: image, callback: callback)
            }
        }
        appRouter.showNext(carDetailsController)
    }
    
    func showCarDrivers(car: Car) {
        let carDriversController = CarDriversController(car: car)
        carDriversController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit") {
            self.showEditCar(car)
        }
        carDriversController.brandTouched = { brand in
            self.brandRouter.showBrandDetails(brand)
        }
        carDriversController.driverTouched = {
            driver in
            
        }
        carDriversController.imageCallback = {
            car, callback in
            if let image = car.image {
                let _ = ImageLoader(url: image, size: 400, callback: callback)
            }
        }
        appRouter.showNext(carDriversController)
    }
    
    func showRandomCarDetails() {
        carLoader.getCars { cars in
            let car = cars[0]
            self.showCarDetails(car)
        }
    }

    func showCarDetails(carId: String) {
        appRouter.showLoading()
        carLoader.getCar(carId) {
            car in
            self.showCarDetails(car)
        }
    }

    func showAddCar() {
        let carFormController = CarFormController(car: carLoader.getEmptyCar())
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(carFormController)
    }

    func showEditCar(car: Car) {
        let carFormController = CarFormController(car: car)
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let car = carFormController.car
            self.carLoader.saveCar(car)
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(carFormController)
    }

    func showEditCar(carId: String) {
        
    }
        
}

protocol CarLoader {
    
    var cars: Set<Car>? { get }
    
    func getCars(callback: [Car] -> Void)
    func getEmptyCar() -> Car
    func getCar(carId: String, callback: Car -> Void)
    func saveCar(car: Car)
    func addListener(callback: Void -> Void)
    
}
