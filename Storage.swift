//
//  Storage.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 11/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

typealias Callback = Void -> Void

protocol Storage {
    
    associatedtype Element: Hashable
    
    var elements: Set<Element>? { get set }
    var listeners: [Callback] { get set }
    
    func getElements(callback: Set<Element> -> Void)
    func getEmptyElement() -> Element
    mutating func setElement(element: Element)
    mutating func deleteElement(element: Element)
    mutating func addListener(callback: Callback)
    
}

extension Storage {
    
    mutating func setElement(element: Element) {
        elements?.insert(element)
        elementsChanged()
    }
    
    mutating func deleteElement(element: Element) {
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
