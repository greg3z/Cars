//
//  DriverDetailController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 12/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DriverDetailsController: UIViewController {
    
    let driver: Driver
    
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
        let detailsView = DetailsView()
        detailsView.setData(UIImage(named: "cocoapods"), string1: nil, buttonTitle: nil, string2: "Name", string21: driver.name, string3: nil, string31: nil)
        addChildView(detailsView, frame: CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height - 64))
    }
    
}
