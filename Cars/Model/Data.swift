//
//  Data.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

func data(delay: UInt32 = 0, brandsCallback: ([Brand] -> Void)? = nil, carsCallback: ([Car] -> Void)? = nil, driversCallback: ([Driver] -> Void)? = nil) {
    let porsche = Brand(id: "", name: "Porsche", image: "")
    let mercedes = Brand(id: "", name: "Mercedes", image: "")
    let bmw = Brand(id: "", name: "BMW", image: "")
    let audi = Brand(id: "", name: "Audi", image: "")
    let ferrari = Brand(id: "", name: "Ferrari", image: "")
    let lamborghini = Brand(id: "", name: "Lamborghini", image: "")
    let maserati = Brand(id: "", name: "Maserati", image: "")
    let brands = [porsche, mercedes, bmw, audi, ferrari, lamborghini, maserati]
    
    var p911 = Car(id: "", brand: porsche, model: "911", image: "911.jpg", drivers: [], horsepower: 420, date: NSDate())
    var amgGt = Car(id: "", brand: mercedes, model: "AMG GT", image: "GT.jpg", drivers: [], horsepower: 500, date: NSDate())
    var cayman = Car(id: "", brand: porsche, model: "Cayman", image: "Cayman.jpg", drivers: [], horsepower: 300, date: NSDate())
    var m4 = Car(id: "", brand: bmw, model: "M4", image: "M4.jpg", drivers: [], horsepower: 420, date: NSDate())
    var r8 = Car(id: "", brand: audi, model: "R8", image: "R8.jpg", drivers: [], horsepower: 520, date: NSDate())
    var california = Car(id: "", brand: ferrari, model: "California", image: "California.jpg", drivers: [], horsepower: 570, date: NSDate())
    let huracan = Car(id: "", brand: lamborghini, model: "Huracan", image: "Huracan.jpg", drivers: [], horsepower: 530, date: NSDate())
    let granTurismo = Car(id: "", brand: maserati, model: "GranTurismo", image: "GranTurismo.jpg", drivers: [], horsepower: 450, date: NSDate())
    var aventador = Car(id: "", brand: lamborghini, model: "Aventador", image: "Aventador.jpg", drivers: [], horsepower: 600, date: NSDate())
    let cars = [p911, amgGt, cayman, m4, r8, california, huracan, granTurismo, aventador]
    
    let greg = Driver(id: "", name: "Greg", cars: [p911, m4, aventador, cayman])
    let luna = Driver(id: "", name: "Luna", cars: [amgGt, m4, cayman])
    let dany = Driver(id: "", name: "Dany", cars: [r8, m4, california])
    let drivers = [greg, luna, dany]
    
    p911.drivers = [greg]
    m4.drivers = [greg, luna, dany]
    aventador.drivers = [greg]
    cayman.drivers = [greg, luna]
    amgGt.drivers = [luna]
    r8.drivers = [dany]
    california.drivers = [dany]
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        sleep(delay)
        dispatch_async(dispatch_get_main_queue()) {
            brandsCallback?(brands)
            carsCallback?(cars)
            driversCallback?(drivers)
        }
    }
}
