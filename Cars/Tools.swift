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
    
}
