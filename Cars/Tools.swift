//
//  Tools.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChildView(viewController: UIViewController, frame: CGRect? = nil) {
        viewController.view.frame = frame ?? view.bounds
        view.addSubview(viewController.view)
        addChildViewController(viewController)
    }
    
    func addChildView(childView: UIView, frame: CGRect? = nil) {
        childView.frame = frame ?? view.bounds
        view.addSubview(childView)
    }
    
}

extension UIControl {
    
    func addActionForEvents(events: UIControlEvents, callback: Void -> Void) {
        let target = Target(callback: callback)
        self.addTarget(target, action: #selector(Target.callCallback), forControlEvents: events)
        objc_setAssociatedObject(self, UnsafeMutablePointer<Int8>.alloc(1), target, .OBJC_ASSOCIATION_RETAIN)
    }
    
}

extension UIBarButtonItem {
    
    convenience init(title: String, callback: Void -> Void) {
        let target = Target(callback: callback)
        self.init(title: title, style: .Plain, target: target, action: #selector(Target.callCallback))
        objc_setAssociatedObject(self, UnsafeMutablePointer<Int8>.alloc(1), target, .OBJC_ASSOCIATION_RETAIN)
    }
    
}

class Target {
    
    let callback: Void -> Void
    
    init(callback: Void -> Void) {
        self.callback = callback
    }
    
    @objc func callCallback() {
        callback()
    }
    
}
