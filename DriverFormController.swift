//
//  DriverFormController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 12/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DriverFormController: UIViewController {
    
    var driver: Driver
    var formView: FormView?
    
    init(driver: Driver) {
        self.driver = driver
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        formView = FormView()
        formView?.setData(nil, button1String: nil, label2String: "Name", textField2String: driver.name, label3String: nil, textField3String: nil)
        formView?.textField1Changed = {
            self.driver = Driver(id: self.driver.id, name: $0, cars: self.driver.cars)
        }
        addChildView(formView!)
    }
    
}
