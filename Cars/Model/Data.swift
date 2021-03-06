//
//  Data.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

var _cars: Set<Car> = []
var _drivers: Set<Driver> = []

func initData() {
    var p911 = Car(id: "111", brand: "Porsche", model: "911", image: "911.jpg", drivers: [])
    var amgGt = Car(id: "222", brand: "Mercedes", model: "AMG GT", image: "GT.jpg", drivers: [])
    var cayman = Car(id: "333", brand: "Porsche", model: "Cayman", image: "Cayman.jpg", drivers: [])
    var m4 = Car(id: "444", brand: "BMW", model: "M4", image: "M4.jpg", drivers: [])
    var r8 = Car(id: "555", brand: "Audi", model: "R8", image: "R8.jpg", drivers: [])
    var california = Car(id: "666", brand: "Ferrari", model: "California", image: "California.jpg", drivers: [])
    let huracan = Car(id: "777", brand: "Lamborghini", model: "Huracan", image: "Huracan.jpg", drivers: [])
    let granTurismo = Car(id: "888", brand: "Maserati", model: "GranTurismo", image: "GranTurismo.jpg", drivers: [])
    var aventador = Car(id: "999", brand: "Lamborghini", model: "Aventador", image: "Aventador.jpg", drivers: [])
    
    let greg = Driver(id: "1111", name: "Greg", cars: [p911, m4, aventador, cayman])
    let luna = Driver(id: "2222", name: "Luna", cars: [amgGt, m4, cayman])
    let dany = Driver(id: "3333", name: "Dany", cars: [r8, m4, california])
    _drivers = [greg, luna, dany]
    
    p911.drivers = [greg]
    m4.drivers = [greg, luna, dany]
    aventador.drivers = [greg]
    cayman.drivers = [greg, luna]
    amgGt.drivers = [luna]
    r8.drivers = [dany]
    california.drivers = [dany]
    
    _cars = [p911, amgGt, cayman, m4, r8, california, huracan, granTurismo, aventador]
}

func _getEmptyCar() -> Car {
    let id = "\(arc4random_uniform(100))"
    let car = Car(id: id, brand: "", model: "", image: "", drivers: [])
    return car
}

func _getEmptyDriver() -> Driver {
    let id = "\(arc4random_uniform(100))"
    let driver = Driver(id: id, name: "", cars: [])
    return driver
}

func getUrlContent(url: NSURL, callback: NSData? -> Void) -> NSURLSessionDataTask {
//    NSLog("getUrlContent \(url)")
    let request = NSURLRequest(URL: url)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        data, response, error in
        if let error = error {
            NSLog("\(error)")
        }
        else {
            callback(data)
        }
    }
    task.resume()
    return task
}

extension NSURLSessionDataTask: CancelableTask {
    
}

import UIKit

class ImageLoader: CancelableTask {
    
    var canceled = false
    
    func cancel() {
        canceled = true
    }
    
    init(url: NSURL, size: CGFloat = 50, callback: UIImage -> Void) {
        getUrlContent(url) {
            data in
            if let data = data, image = UIImage(data: data, scale: UIScreen.mainScreen().scale) {
                if self.canceled {
                    return
                }
//                sleep(1)
                if self.canceled {
                    return
                }
                UIGraphicsBeginImageContext(CGSizeMake(size, size))
                image.drawInRect(CGRectMake(0, 0, size, size))
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                if self.canceled {
                    return
                }
                dispatch_async(dispatch_get_main_queue()) {
                    if self.canceled {
                        return
                    }
                    callback(newImage)
                }
            }
        }
    }
    
}
