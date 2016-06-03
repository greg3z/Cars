//
//  Data.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

var cars: [Car] = []
var brands: [Brand] = []
var drivers: [Driver] = []

func initData() {
    let porsche = Brand(id: "11", name: "Porsche", image: "")
    let mercedes = Brand(id: "22", name: "Mercedes", image: "")
    let bmw = Brand(id: "33", name: "BMW", image: "")
    let audi = Brand(id: "44", name: "Audi", image: "")
    let ferrari = Brand(id: "55", name: "Ferrari", image: "")
    let lamborghini = Brand(id: "66", name: "Lamborghini", image: "")
    let maserati = Brand(id: "77", name: "Maserati", image: "")
    brands = [porsche, mercedes, bmw, audi, ferrari, lamborghini, maserati]
    
    var p911 = Car(id: "111", brand: porsche, model: "911", image: "911.jpg", drivers: [], horsepower: 420, date: NSDate())
    var amgGt = Car(id: "222", brand: mercedes, model: "AMG GT", image: "GT.jpg", drivers: [], horsepower: 500, date: NSDate())
    var cayman = Car(id: "333", brand: porsche, model: "Cayman", image: "Cayman.jpg", drivers: [], horsepower: 300, date: NSDate())
    var m4 = Car(id: "444", brand: bmw, model: "M4", image: "M4.jpg", drivers: [], horsepower: 420, date: NSDate())
    var r8 = Car(id: "555", brand: audi, model: "R8", image: "R8.jpg", drivers: [], horsepower: 520, date: NSDate())
    var california = Car(id: "666", brand: ferrari, model: "California", image: "California.jpg", drivers: [], horsepower: 570, date: NSDate())
    let huracan = Car(id: "777", brand: lamborghini, model: "Huracan", image: "Huracan.jpg", drivers: [], horsepower: 530, date: NSDate())
    let granTurismo = Car(id: "888", brand: maserati, model: "GranTurismo", image: "GranTurismo.jpg", drivers: [], horsepower: 450, date: NSDate())
    var aventador = Car(id: "999", brand: lamborghini, model: "Aventador", image: "Aventador.jpg", drivers: [], horsepower: 600, date: NSDate())
    cars = [p911, amgGt, cayman, m4, r8, california, huracan, granTurismo, aventador]
    
    let greg = Driver(id: "1111", name: "Greg", cars: [p911, m4, aventador, cayman])
    let luna = Driver(id: "2222", name: "Luna", cars: [amgGt, m4, cayman])
    let dany = Driver(id: "3333", name: "Dany", cars: [r8, m4, california])
    drivers = [greg, luna, dany]
    
    p911.drivers = [greg]
    m4.drivers = [greg, luna, dany]
    aventador.drivers = [greg]
    cayman.drivers = [greg, luna]
    amgGt.drivers = [luna]
    r8.drivers = [dany]
    california.drivers = [dany]
}

func getCars(callback: [Car] -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        sleep(1)
        dispatch_async(dispatch_get_main_queue()) {
            callback(cars)
        }
    }
}

func getBrands(callback: [Brand] -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        sleep(1)
        dispatch_async(dispatch_get_main_queue()) {
            callback(brands)
        }
    }
}

func getDrivers(callback: [Driver] -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        sleep(1)
        dispatch_async(dispatch_get_main_queue()) {
            callback(drivers)
        }
    }
}
