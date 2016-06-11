//
//  Storage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 11/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

typealias Callback = Void -> Void

protocol Storage {
    
    associatedtype T: Hashable
    
    var elements: Set<T>? { get set }
    var listeners: [Callback] { get set }
    
    func getElements(callback: Set<T> -> Void)
    func getEmptyElement() -> T
    mutating func setElement(element: T)
    mutating func deleteElement(element: T)
    mutating func addListener(callback: Callback)
    
}

extension Storage {
    
    mutating func setElement(element: T) {
        elements?.insert(element)
        elementsChanged()
    }
    
    mutating func deleteElement(element: T) {
        elements?.remove(element)
        elementsChanged()
    }
    
    func elementsChanged() {
        for callback in listeners {
            callback()
        }
    }
    
    mutating func addListener(callback: Callback) {
        listeners.append(callback)
    }
    
}
