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
    var brand: String
    var model: String
    var image: String
    var drivers: [Driver]
    
}

extension Car: Hashable {
    
    var hashValue: Int {
        return id.hashValue
    }
    
}

func ==(lhs: Car, rhs: Car) -> Bool {
    return lhs.id == rhs.id && lhs.brand == rhs.brand && lhs.model == rhs.model && lhs.image == rhs.image && lhs.drivers == rhs.drivers
}
