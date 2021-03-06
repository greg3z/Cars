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
        view.backgroundColor = .whiteColor()
        let detailsView = DetailsView()
        detailsView.setData(UIImage(named: car.image), string1: "Brand", string2: "Model", string11: car.brand, string21: car.model)
        addChildView(detailsView, frame: CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height - 64))
        imageCallback?(car) {
            image in
            detailsView.setImage(image)
        }
    }
    
}
