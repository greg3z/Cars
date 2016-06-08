//
//  BrandRouter.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class BrandRouter {
    
    let appRouter: AppRouter
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
    func showBrandDetails(brand: Brand) {
        let brandDetailsController = BrandDetailsController(brand: brand)
        appRouter.showNext(brandDetailsController)
    }
    
}
