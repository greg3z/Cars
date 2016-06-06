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
    var carTouched: (Car -> Void)?
    
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
        carsListView.configureCell = {
            car, cell in
            cell.imageView?.image = UIImage(named: "cocoapods")
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = car.model + "\na\na\na\na\na"
            let task = ImageLoader(urlString: car.image) {
                image in
                cell.imageView?.image = image
            }
            carsListView.asyncTask(task, forCell: cell)
        }
        carsListView.elementTouched = carTouched
        addChildView(carsListView)
    }
    
}
