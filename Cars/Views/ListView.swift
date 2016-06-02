//
//  ListView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class ListView<T>: UITableViewController {
    
    var elements: [T]
    var configureCell: ((T, UITableViewCell) -> Void)?
    
    init(elements: [T], style: UITableViewStyle = .Plain) {
        self.elements = elements
        super.init(style: style)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        let element = elements[indexPath.row]
        configureCell?(element, cell)
        return cell
    }
    
}
