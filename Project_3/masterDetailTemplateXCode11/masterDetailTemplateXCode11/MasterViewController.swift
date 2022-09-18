//
//  MasterViewController.swift
//  masterDetailTemplateXCode11
//
//  Created by R.O. Chapman on 11/18/20.
//  Copyright © 2020 R.O. Chapman. All rights reserved.
//
//  Updated by George Martin on 07/03/22 for functionality
//  Auburn University, Summer 2022, COMP 5970
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var tasks = [String]()
    var selectedItem = 0 //Tracks what we need to update
    var TaskName = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Master View"
        
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc
    func insertNewObject(_ sender: Any) {
        tasks.insert("", at: 0)
        TaskName.insert("", at: 0)
        performSegue(withIdentifier: "showDetail", sender: nil)

    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
                detailViewController!.masterController = self
            
                //This makes sure detail view for selected item displays and not just last updated
                selectedItem = indexPath.row
            }
            
            else{
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
                detailViewController!.masterController = self
                selectedItem = 0
            }
        }
    }

    //Allows unwind from detail back to Master
    @IBAction func unwindToMasterView(segue: UIStoryboardSegue) {
        
    }
    
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Sets rows to the number of items in tasks
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = tasks[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    //Implements Editability
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Implements Delete Functionality
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //Implements Orderings Funcionality
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMoveObject = tasks[sourceIndexPath.row]
        let itemToMoveDescription = TaskName[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        TaskName.remove(at: sourceIndexPath.row)
        tasks.insert(itemToMoveObject, at: destinationIndexPath.row)
        TaskName.insert(itemToMoveDescription, at: destinationIndexPath.row)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

