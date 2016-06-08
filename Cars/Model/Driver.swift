//
//  Driver.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

struct Driver {
    
    let id: String
    let name: String
    var cars: [Car]
    
}

extension Driver: Hashable {
    
    var hashValue: Int {
        return id.hashValue
    }
    
}

func ==(lhs: Driver, rhs: Driver) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name && lhs.cars == rhs.cars
}
