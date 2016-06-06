//
//  CarDetailsController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarDetailsController: UIViewController {
    
    let car: Car
    var brandTouched: (Brand -> Void)?
    
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let doubleLabelView = DoubleLabelView()
//        doubleLabelView.label1String = car.model
//        doubleLabelView.label2String = car.brand.name
//        addChildView(doubleLabelView)
        
        let labelButtonView = LabelButtonView()
        labelButtonView.labelString = car.model
        labelButtonView.buttonTitle = car.brand.name
        labelButtonView.buttonTouched = {
            self.brandTouched?(self.car.brand)
        }
        let halfHeight = view.frame.height / 2
        addChildView(labelButtonView, frame: CGRect(x: 0, y: 0, width: view.frame.width, height: halfHeight))
        
        let driversListController = DriversListController(drivers: car.drivers)
        addChildView(driversListController, frame: CGRect(x: 0, y: halfHeight, width: view.frame.width, height: halfHeight))
    }
    
}
