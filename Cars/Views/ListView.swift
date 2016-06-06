//
//  ListView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class ListView<T>: UITableViewController {
    
    let cellId = "cellId"
    var elements: [T]
    var configureCell: ((T, UITableViewCell) -> Void)?
    var elementTouched: (T -> Void)?
    var cancelableTasks = [UITableViewCell: CancelableTask]()
    
    init(elements: [T], style: UITableViewStyle = .Plain) {
        self.elements = elements
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 60
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        let element = elements[indexPath.row]
        configureCell?(element, cell)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let element = elements[indexPath.row]
        elementTouched?(element)
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let task = cancelableTasks[cell] {
            task.cancel()
            cancelableTasks[cell] = nil
        }
    }
    
    func asyncTask(task: CancelableTask, forCell cell: UITableViewCell) {
        cancelableTasks[cell] = task
    }
    
    func refreshCell(cell: UITableViewCell) {
        if let indexPath = tableView.indexPathForCell(cell) {
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    
}

protocol CancelableTask {
    
    func cancel()
    
}
