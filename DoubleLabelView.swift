//
//  DoubleLabelView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DoubleLabelView: UIStackView {
    
    let label1 = UILabel()
    let label2 = UILabel()
    var label1String: String? {
        get {
            return label1.text
        }
        set {
            label1.text = newValue
        }
    }
    var label2String: String? {
        get {
            return label2.text
        }
        set {
            label2.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(label1)
        addArrangedSubview(label2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
