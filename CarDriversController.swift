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
    var driverTouched: (Driver -> Void)?
    var imageCallback: ((Car, UIImage -> Void) -> Void)?
    
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
        let labelHeight: CGFloat = 40
        let carDetailsController = CarDetailsController(car: car)
        carDetailsController.imageCallback = imageCallback
        addChildView(carDetailsController, frame: CGRect(x: 0, y: 0, width: view.frame.width, height: halfHeight))
        let driversListController = DriversListController(drivers: car.drivers)
        addChildView(driversListController, frame: CGRect(x: 0, y: halfHeight + labelHeight, width: view.frame.width, height: halfHeight - labelHeight))
        let label = UILabel()
        label.text = "Drivers"
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        let marginView = UIView()
        marginView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addChildView(marginView, frame: CGRect(x: 0, y: halfHeight, width: 15, height: labelHeight))
        addChildView(label, frame: CGRect(x: 15, y: halfHeight, width: view.frame.width - 15, height: labelHeight))
    }
    
}
