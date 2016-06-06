//
//  BrandRouter.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class BrandRouter {
    
    static let sharedInstance = BrandRouter()
    
    func showBrandDetails(brand: Brand) {
        let brandDetailsController = BrandDetailsController(brand: brand)
        AppRouter.sharedInstance.showNext(brandDetailsController)
    }
    
}
