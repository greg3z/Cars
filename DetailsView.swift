//
//  DetailsView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class DetailsView: UIStackView {
    
    let imageView = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let button = UIButton(type: .System)
    let label21 = UILabel()
    let label31 = UILabel()
    var buttonTouched: (Void -> Void)?
    
    init() {
        super.init(frame: .zero)
        let spacing: CGFloat = 10
        let stackView1 = UIStackView(arrangedSubviews: [label1, button])
        let stackView2 = UIStackView(arrangedSubviews: [label2, label21])
        let stackView3 = UIStackView(arrangedSubviews: [label3, label31])
        stackView1.spacing = spacing
        stackView2.spacing = spacing
        stackView3.spacing = spacing
        self.spacing = spacing
        let rightStackView = UIStackView(arrangedSubviews: [stackView1, stackView2, stackView3])
        label21.textAlignment = .Right
        label31.textAlignment = .Right
        rightStackView.axis = .Vertical
        addArrangedSubview(imageView)
        addArrangedSubview(rightStackView)
        button.addActionForEvents(.TouchUpInside) {
            self.buttonTouched?()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(image: UIImage? = nil, string1: String? = nil, buttonTitle: String? = nil, string2: String? = nil, string21: String? = nil, string3: String? = nil, string31: String? = nil) {
        imageView.image = image
        label1.text = string1
        button.setTitle(buttonTitle, forState: .Normal)
        label2.text = string2
        label21.text = string21
        label3.text = string3
        label31.text = string31
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
}
