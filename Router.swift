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
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    
    func showCarsList() {
        data(carsCallback: { cars in
            let carsListController = CarsListController(cars: cars)
            self.navigationController?.pushViewController(carsListController, animated: true)
        })
    }

    func showCarDetails(car: Car) {
        
    }

    func showCarDetails(carId: String) {
        
    }

    func showAddCar() {
        
    }

    func showEditCar(car: Car) {
        
    }

    func showEditCar(carId: String) {
        
    }
        
}
