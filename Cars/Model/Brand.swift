//
//  Brand.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

struct Brand {

    let id: String
    let name: String
    let image: String
    
}

extension Brand: Hashable {
    
    var hashValue: Int {
        return id.hashValue
    }
    
}

func ==(lhs: Brand, rhs: Brand) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name && lhs.image == rhs.image
}
