//
//  ListView.swift
//  Cars
//
//  Created by Grégoire Lhotellier on 02/06/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class SimpleListView<T>: UITableViewController {
    
    let cellId = "cellId"
    var elements: [T] {
        didSet {
            tableView.reloadData()
        }
    }
    var configureCell: ((T, UITableViewCell) -> Void)?
    var elementTouched: (T -> Void)?
    var cancelableTasks = [UITableViewCell: CancelableTask]()
    var editActions: (T -> [EditAction])?
    var elementAction: ((T, String) -> Void)?
    
    init(elements: [T], style: UITableViewStyle = .Plain) {
        self.elements = elements
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 60
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
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
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let element = elements[indexPath.row]
        var rowActions = [UITableViewRowAction]()
        for editAction in editActions?(element) ?? [] {
            let rowAction = UITableViewRowAction(style: editAction.style, title: editAction.title) {
                [weak self] _, indexPath in
                tableView.setEditing(false, animated: true)
                self?.elementAction?(element, editAction.title)
            }
            rowActions.append(rowAction)
        }
        return rowActions
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

struct EditAction {
    
    let title: String
    let style: UITableViewRowActionStyle
    
}

protocol CancelableTask {
    
    func cancel()
    
}
