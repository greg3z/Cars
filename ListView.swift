//
//  ListView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 06/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class ListView<T>: UIViewController {
    
    var elements: [T] {
        didSet {
            simpleListView?.elements = elements
        }
    }
    let style: UITableViewStyle
    let emptyMessage: String?
    var configureCell: ((T, UITableViewCell) -> Void)?
    var elementTouched: (T -> Void)?
    var simpleListView: SimpleListView<T>?
    var editActions: (T -> [EditAction])?
    var elementAction: ((T, String) -> Void)?
    
    init(elements: [T], style: UITableViewStyle = .Plain, emptyMessage: String? = nil) {
        self.elements = elements
        self.style = style
        self.emptyMessage = emptyMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if elements.isEmpty {
            let label = UILabel()
            label.text = emptyMessage
            addChildView(label)
        }
        else {
            simpleListView = SimpleListView(elements: elements, style: style)
            simpleListView!.configureCell = configureCell
            simpleListView!.elementTouched = elementTouched
            simpleListView!.editActions = editActions
            simpleListView!.elementAction = elementAction
            addChildView(simpleListView!)
        }
    }
    
    func asyncTask(task: CancelableTask, forCell cell: UITableViewCell) {
        simpleListView?.asyncTask(task, forCell: cell)
    }
    
}
