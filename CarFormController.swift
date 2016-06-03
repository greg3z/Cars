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
    var formView: FormView?
    
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
        formView = FormView(fields: [modelField, horsepowerField])
        addChildView(formView!)
    }
    
    func getCar() -> Car {
        let model = formView?.fields[0].textFieldString ?? "empty"
        let horsepower = Int(formView?.fields[1].textFieldString ?? "3") ?? 4
        let brand = Brand(id: "", name: "NoBrand", image: "")
        let car = Car(id: "", brand: brand, model: model, image: "", drivers: [], horsepower: horsepower, date: NSDate())
        return car
    }
    
}
