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
    let textField1 = UITextField()
    let textField2 = UITextField()
    var textField1Changed: (String -> Void)?
    var textField2Changed: (String -> Void)?
    
    init() {
        super.init(frame: .zero)
        axis = .Vertical
        distribution = .FillEqually
        spacing = 10
        let stackView1 = UIStackView(arrangedSubviews: [label1, textField1])
        let stackView2 = UIStackView(arrangedSubviews: [label2, textField2])
        stackView1.distribution = .FillEqually
        stackView2.distribution = .FillEqually
        addArrangedSubview(stackView1)
        addArrangedSubview(stackView2)
        textField1.borderStyle = .RoundedRect
        textField2.borderStyle = .RoundedRect
        textField1.delegate = self
        textField2.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(label1String: String? = nil, label2String: String? = nil, textField1String: String? = nil, textField2String: String? = nil) {
        label1.text = label1String
        label2.text = label2String
        textField1.text = textField1String
        textField2.text = textField2String
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let text: NSString = textField.text {
            let value = text.stringByReplacingCharactersInRange(range, withString: string)
            textField == textField2 ? textField1Changed?(value) : textField2Changed?(value)
        }
        return true
    }
    
}
