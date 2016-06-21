//
//  CarStorage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 08/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

final class CarStorage: Storage {
    
    var elements: Set<Car>?
    var listeners = [Callback]()
    
    func getElements(callback: Set<Car> -> Void) {
        if elements == nil {
            elements = _cars
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
//            usleep(500000)
            dispatch_async(dispatch_get_main_queue()) {
                callback(self.elements!)
            }
        }
    }
    
    func getEmptyElement() -> Car {
        return _getEmptyCar()
    }
    
}
