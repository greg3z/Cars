//
//  CarStorage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 08/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

class CarStorage: CarLoader {
    
    func getCars(callback: [Car] -> Void) {
        _getCars(callback)
    }
    
    func getEmptyCar() -> Car {
        return _getEmptyCar()
    }
    
    func getCar(carId: String, callback: Car -> Void) {
        _getCar(carId, callback: callback)
    }
    
}
