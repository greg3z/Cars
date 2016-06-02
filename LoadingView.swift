//
//  LoadingView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

// suck to do it as a UIViewController
final class LoadingView: UIViewController {
    
    let loader = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startAnimating()
        view.addSubview(loader)
        view.backgroundColor = .whiteColor()
        loader.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    
}
