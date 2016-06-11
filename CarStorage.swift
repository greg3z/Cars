//
//  CarStorage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 08/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

typealias Callback = Void -> Void

final class CarStorage: CarLoader {
    
    var cars: Set<Car>?
    var listeners = [Callback]()
    
    func getCars(callback: [Car] -> Void) {
        if cars == nil {
            cars = _cars
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            sleep(0)
            dispatch_async(dispatch_get_main_queue()) {
                callback(Array(self.cars!))
            }
        }
    }
    
    func getEmptyCar() -> Car {
        return _getEmptyCar()
    }
    
    func getCar(carId: String, callback: Car -> Void) {
        _getCar(carId, callback: callback)
    }
    
    func saveCar(car: Car) {
        cars?.insert(car)
        for callback in listeners {
            callback()
        }
    }
    
    func addListener(callback: Void -> Void) {
        listeners.append(callback)
    }
    
}
