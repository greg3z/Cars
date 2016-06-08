//
//  FormView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class FormView: UIStackView, UITextFieldDelegate {
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let button1 = UIButton(type: .System)
    let textField2 = UITextField()
    let textField3 = UITextField()
    var buttonTouched: (Void -> Void)?
    var textField1Changed: (String -> Void)?
    var textField2Changed: (String -> Void)?
    
    init() {
        super.init(frame: .zero)
        axis = .Vertical
        distribution = .FillEqually
        let stackView1 = UIStackView(arrangedSubviews: [label1, button1])
        let stackView2 = UIStackView(arrangedSubviews: [label2, textField2])
        let stackView3 = UIStackView(arrangedSubviews: [label3, textField3])
        addArrangedSubview(stackView1)
        addArrangedSubview(stackView2)
        addArrangedSubview(stackView3)
        button1.addActionForEvents(.TouchUpInside) {
            self.buttonTouched?()
        }
        textField2.delegate = self
        textField3.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(label1String: String? = nil, button1String: String? = nil, label2String: String? = nil, textField2String: String? = nil, label3String: String? = nil, textField3String: String? = nil) {
        label1.text = label1String
        button1.setTitle(button1String, forState: .Normal)
        label2.text = label2String
        textField2.text = textField2String
        label3.text = label3String
        textField3.text = textField3String
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let text: NSString = textField.text {
            let value = text.stringByReplacingCharactersInRange(range, withString: string)
            textField == textField2 ? textField1Changed?(value) : textField2Changed?(value)
        }
        return true
    }
    
}
