//
//  Car.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

struct Car {
    
    let id: String
    var brand: Brand?
    var model: String
    var image: NSURL?
    var drivers: [Driver]
    var horsepower: Int
    var date: NSDate
    
}
