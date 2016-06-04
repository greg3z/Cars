//
//  FieldView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class FieldView: UIStackView, UITextFieldDelegate {
    
    let label = UILabel()
    let textField = UITextField()
    var labelString: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    var textFieldString: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    var textFieldChanged: (String -> Void)?
    
    init() {
        super.init(frame: .zero)
        distribution = .FillEqually
        addArrangedSubview(label)
        addArrangedSubview(textField)
        label.backgroundColor = .whiteColor()
        textField.backgroundColor = .greenColor()
        textField.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textFieldChanged?(textField.text ?? "")
        return true
    }
    
}
