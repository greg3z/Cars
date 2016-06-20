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
    let label11 = UILabel()
    let label21 = UILabel()
    
    init() {
        super.init(frame: .zero)
        let spacing: CGFloat = 10
        let stackView1 = UIStackView(arrangedSubviews: [label1, label11])
        let stackView2 = UIStackView(arrangedSubviews: [label2, label21])
        stackView1.spacing = spacing
        stackView2.spacing = spacing
        stackView1.layoutMarginsRelativeArrangement = true
        stackView1.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: spacing)
        stackView2.layoutMarginsRelativeArrangement = true
        stackView2.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: spacing)
        layoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: spacing, right: 0)
        self.spacing = spacing
        axis = .Vertical
        label11.textAlignment = .Right
        label21.textAlignment = .Right
        addArrangedSubview(imageView)
        addArrangedSubview(stackView1)
        addArrangedSubview(stackView2)
        addArrangedSubview(UIView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(image: UIImage? = nil, string1: String? = nil, string2: String? = nil, string11: String? = nil, string21: String? = nil) {
        imageView.image = image
        label1.text = string1
        label2.text = string2
        label11.text = string11
        label21.text = string21
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
}
