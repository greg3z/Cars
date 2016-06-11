//
//  DeletableCarsListController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 12/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DeletableCarsListController: UIViewController {
    
    var cars: [Car] {
        didSet {
            carsListController?.cars = cars
        }
    }
    var carTouched: (Car -> Void)?
    var imageCallback: ((Car, UIImage -> Void) -> CancelableTask?)?
    var carsListController: CarsListController?
    var deleteCar: (Car -> Void)?
    
    init(cars: [Car]) {
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsListController = CarsListController(cars: cars)
        carsListController!.carTouched = carTouched
        carsListController!.imageCallback = imageCallback
        carsListController!.editActions = {
            car in
            return [EditAction(title: Action.Delete.rawValue, style: .Destructive)]
        }
        carsListController!.elementAction = {
            car, action in
            if action == Action.Delete.rawValue {
                self.deleteCar?(car)
            }
        }
        addChildView(carsListController!)
    }
    
}

extension DeletableCarsListController {
    
    enum Action: String {
        case Delete
    }
    
}
