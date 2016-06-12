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
    var carStorage: CarStorage
    
    init(appRouter: AppRouter, carStorage: CarStorage) {
        self.appRouter = appRouter
        self.carStorage = carStorage
    }
    
    func showCarsList(tab: AppRouter.Tab) {
        appRouter.showLoading(tab)
        carStorage.getElements { cars in
            self.showCarsList(Array(cars), tab: tab)
        }
    }
    
    func showCarsList(cars: [Car], tab: AppRouter.Tab) {
        let carsListController = DeletableCarsListController(cars: cars)
        carsListController.carTouched = {
            car in
            self.showCarDrivers(car, tab: tab)
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
        carsListController.deleteCar = {
            self.carStorage.deleteElement($0)
        }
        carStorage.addListener {
            carsListController.cars = Array(self.carStorage.elements!)
        }
        appRouter.showNext(carsListController, tab: tab)
    }

    func showCarDetails(car: Car, tab: AppRouter.Tab) {
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
        appRouter.showNext(carDetailsController, tab: tab)
    }
    
    func showCarDrivers(car: Car, tab: AppRouter.Tab) {
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
        appRouter.showNext(carDriversController, tab: tab)
    }
    
    func showCarDetails(carId: String, tab: AppRouter.Tab) {
        appRouter.showLoading(tab)
        carStorage.getElements {
            cars in
            let filteredCars = cars.filter {
                $0.id == carId
            }
            if let car = filteredCars.first {
                self.showCarDetails(car, tab: tab)
            }
        }
    }

    func showAddCar() {
        let carFormController = CarFormController(car: carStorage.getEmptyElement())
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let car = carFormController.car
            self.carStorage.setElement(car)
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(carFormController)
    }

    func showEditCar(car: Car) {
        let carFormController = CarFormController(car: car)
        carFormController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save") {
            let car = carFormController.car
            self.carStorage.setElement(car)
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(carFormController)
    }
   
}
