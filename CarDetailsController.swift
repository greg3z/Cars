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
        let labelButtonView = LabelButtonView()
        labelButtonView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        labelButtonView.labelString = car.model
        labelButtonView.buttonTitle = car.brand.name
        labelButtonView.buttonTouched = {
            self.brandTouched?(self.car.brand)
        }
        addChildView(labelButtonView)
    }
    
}
