//
//  CarDriversController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarDriversController: UIViewController {
    
    let car: Car
    var brandTouched: (Brand -> Void)?
    var driverTouched: (Driver -> Void)?
    
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let halfHeight = view.frame.height / 2
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.brandTouched = brandTouched
        addChildView(carDetailsController, frame: CGRect(x: 0, y: 0, width: view.frame.width, height: halfHeight))
        let driversListController = DriversListController(drivers: car.drivers)
        addChildView(driversListController, frame: CGRect(x: 0, y: halfHeight, width: view.frame.width, height: halfHeight))
    }
    
}
