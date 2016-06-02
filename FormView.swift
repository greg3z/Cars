//
//  FormView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class FormView: UIStackView {
    
    var fields: [FieldView]
    
    init(fields: [FieldView]) {
        self.fields = fields
        super.init(frame: .zero)
        axis = .Vertical
        distribution = .FillEqually
        for field in fields {
            addArrangedSubview(field)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
