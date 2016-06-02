//
//  CarFormController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarFormController: UIViewController {
    
    var car: Car?
    
    init(car: Car?) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = car?.model
        let horsepower = car == nil ? "" : "\(car!.horsepower)"
        let modelField = FieldView()
        modelField.labelString = "Model"
        modelField.textFieldString = model
        let horsepowerField = FieldView()
        horsepowerField.labelString = "Horsepower"
        horsepowerField.textFieldString = horsepower
        let formView = FormView(fields: [modelField, horsepowerField])
        addChildView(formView)
    }
    
}
