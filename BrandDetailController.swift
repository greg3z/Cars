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
        view.backgroundColor = .whiteColor()
        let detailsView = DetailsView()
        detailsView.setData(UIImage(named: "cocoapods"), string2: "Brand", string21: brand.name, string3: "id", string31: brand.id)
        addChildView(detailsView)
    }
    
}

