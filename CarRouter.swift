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
            self.showCarDetails(car, tab: tab)
        }
        carsListController.deleteCar = {
            self.carStorage.deleteElement($0)
        }
        carStorage.addListener {
            carsListController.cars = Array(self.carStorage.elements!)
        }
        carsListController.navBarRightButton("Add") {
            self.showAddCar()
        }
        appRouter.showNext(carsListController, tab: tab)
    }

    func showCarDetails(car: Car, tab: AppRouter.Tab) {
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.navBarRightButton("Edit") {
            self.showEditCar(car)
        }
        let padding: CGFloat = 15
        let formHeight: CGFloat = 100
        let width = appRouter.carsNavigationController.view.frame.width
        appRouter.showNext(carDetailsController, tab: tab, frame: CGRect(x: padding, y: 70, width: width - 2 * padding, height: formHeight))
    }
    
    func showCarDrivers(car: Car, tab: AppRouter.Tab) {
        let carDriversController = CarDriversController(car: car)
        carDriversController.navBarRightButton("Edit") {
            self.showEditCar(car)
        }
        carDriversController.driverTouched = {
            driver in
            
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
        carFormController.navBarRightButton("Save") {
            let car = carFormController.car
            self.carStorage.setElement(car)
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        let padding: CGFloat = 15
        let formHeight: CGFloat = 100
        let width = appRouter.carsNavigationController.view.frame.width
        appRouter.showModal(carFormController, frame: CGRect(x: padding, y: 70, width: width - 2 * padding, height: formHeight))
    }

    func showEditCar(car: Car) {
        let carFormController = CarFormController(car: car)
        carFormController.navBarRightButton("Save") {
            let car = carFormController.car
            self.carStorage.setElement(car)
            carFormController.dismissViewControllerAnimated(true, completion: nil)
        }
        appRouter.showModal(carFormController)
    }
   
}
