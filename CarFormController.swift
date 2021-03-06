//
//  CarFormController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarFormController: UIViewController {
    
    var car: Car
    var formView: FormView?
    
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        formView = FormView()
        formView?.setData("Brand", textField1String: car.brand, label2String: "Model", textField2String: car.model)
        formView?.textField1Changed = {
            self.car = Car(id: self.car.id, brand: self.car.brand, model: $0, image: self.car.image, drivers: self.car.drivers)
        }
        addChildView(formView!)
    }
    
}
