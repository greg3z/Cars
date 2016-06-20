//
//  File.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarsListController: UIViewController {
    
    var cars: [Car] {
        didSet {
            carsListView?.elements = cars
        }
    }
    var carTouched: (Car -> Void)?
    var imageCallback: ((Car, UIImage -> Void) -> CancelableTask?)?
    var editActions: (Car -> [EditAction])?
    var elementAction: ((Car, String) -> Void)?
    var carsListView: ListView<Car>?
    
    init(cars: [Car]) {
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsListView = ListView(elements: cars)
        carsListView!.configureCell = {
            car, cell in
            guard let image = UIImage(named: car.image) else { return }
            let width: CGFloat = 70
            let height = image.size.height * width / image.size.width
            UIGraphicsBeginImageContext(CGSizeMake(width, height))
            image.drawInRect(CGRectMake(0, 0, width, height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            cell.imageView?.image = newImage
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = car.model// + "\na\na\na\na\na"
        }
        carsListView!.elementTouched = carTouched
        carsListView!.editActions = editActions
        carsListView!.elementAction = elementAction
        addChildView(carsListView!)
    }
    
}
