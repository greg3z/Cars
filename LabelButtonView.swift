//
//  LabelButtonView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 03/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class LabelButtonView: UIStackView {
    
    let label = UILabel()
    let button = UIButton(type: .System)
    var buttonTouched: (Void -> Void)?
    var labelString: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    var buttonTitle: String? {
        get {
            return button.titleForState(.Normal)
        }
        set {
            button.setTitle(newValue, forState: .Normal)
        }
    }
    
    init() {
        super.init(frame: .zero)
        label.backgroundColor = .whiteColor()
        button.backgroundColor = .whiteColor()
        button.addActionForEvents(.TouchUpInside) {
            self.buttonTouched?()
        }
        addArrangedSubview(label)
        addArrangedSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
