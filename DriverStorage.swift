//
//  DriverStorage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 08/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

final class DriverStorage: DriverLoader {
    
    func getDrivers(callback: [Driver] -> Void) {
        _getDrivers(callback)
    }
    
}
