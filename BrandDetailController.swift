//
//  BrandDetailController.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 03/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class BrandDetailsController: UIViewController {
    
    let brand: Brand
    
    init(brand: Brand) {
        self.brand = brand
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doubleLabelView = DoubleLabelView()
        doubleLabelView.label1String = brand.id
        doubleLabelView.label2String = brand.name
        addChildView(doubleLabelView)
    }
    
}

