//
//  File.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarsListController: UIViewController {
    
    var cars: [Car]
    
    init(cars: [Car]) {
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let carsListView = ListView(elements: cars)
        addChildView(carsListView)
    }
    
}
