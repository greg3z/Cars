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
    let brand: Brand
    let model: String
    let image: String
    var drivers: [Driver]
    let horsepower: Int
    let date: NSDate
    
}
