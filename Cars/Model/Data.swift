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
    var p911 = Car(id: "111", model: "911", image: NSURL(string: "http://www.meister-motors.com/img/911-gt3rs05.jpg")!, drivers: [], horsepower: 420, date: NSDate())
    var amgGt = Car(id: "222", model: "AMG GT", image: NSURL(string: "http://gtspirit.com/wp-content/uploads/2014/10/2048_0990fd90fs09fas09fs09fs90fsfs09244242.jpg")!, drivers: [], horsepower: 500, date: NSDate())
    var cayman = Car(id: "333", model: "Cayman", image: NSURL(string: "http://files.porsche.com/filestore/image/multimedia/none/rd-2013-981-c7-modelimage-sideshot/model/032d028c-374b-11e3-bd76-001a64c55f5c;s3/porsche-model.png")!, drivers: [], horsepower: 300, date: NSDate())
    var m4 = Car(id: "444", model: "M4", image: NSURL(string: "http://buyersguide.caranddriver.com/media/assets/submodel/6932.jpg")!, drivers: [], horsepower: 420, date: NSDate())
    var r8 = Car(id: "555", model: "R8", image: NSURL(string: "http://blogs-images.forbes.com/matthewdepaula/files/2015/02/2017-Audi-R8-V10-Plus.jpg")!, drivers: [], horsepower: 520, date: NSDate())
    var california = Car(id: "666", model: "California", image: NSURL(string: "http://bestcarmag.com/sites/default/files/6982632271873-ferrari-california.jpg")!, drivers: [], horsepower: 570, date: NSDate())
    let huracan = Car(id: "777", model: "Huracan", image: NSURL(string: "http://www.topgear.com/sites/default/files/styles/fit_1960x1102/public/images/cars-road-test/carousel/2016/02/7e3e2773b42c912c58dffc8f1a717545/lp610_4_white_005.jpg?itok=a1lUTfYy")!, drivers: [], horsepower: 530, date: NSDate())
    let granTurismo = Car(id: "888", model: "GranTurismo", image: NSURL(string: "http://srv2.betterparts.org/images/maserati-granturismo-05.jpg")!, drivers: [], horsepower: 450, date: NSDate())
    var aventador = Car(id: "999", model: "Aventador", image: NSURL(string: "http://buyersguide.caranddriver.com/media/assets/submodel/6869.jpg")!, drivers: [], horsepower: 600, date: NSDate())
    
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
    let car = Car(id: id, model: "", image: nil, drivers: [], horsepower: 0, date: NSDate())
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
