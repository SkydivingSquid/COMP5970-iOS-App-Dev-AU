//
//  MasterViewController.swift
//  masterDetailTemplateXCode11
//
//  Created by R.O. Chapman on 11/18/20.
//  Copyright © 2020 R.O. Chapman. All rights reserved.
//
//  Updated by George Martin on 07/12/22 for functionality
//  Auburn University, Summer 2022, COMP 5970
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var selectedItem = 0 //Tracks what we need to update
    var taskAndDetails: [[String:String]] = [] //Dictionary to save data

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
        
        let fileURL = self.dataFileURL()
        
        //If file exists, open it
        if(FileManager.default.fileExists(atPath: fileURL.path)){
            //Print to screen that a file has been found
            print("A save file has been found")
            //Print file path for ease of access
            print(fileURL.path)
            taskAndDetails = (NSArray(contentsOf: fileURL as URL) as? [[String:String]])!
        }
        //If file doesn't exist, create one
        else{
            //Print to screen that a new file has been created
            print("A new file has been created")
            if let URL = Bundle.main.url(forResource: "Property List", withExtension: "plist") {
                if let arrayFromPlist = NSArray(contentsOf: URL) as? [Dictionary <String, String>] {
                    taskAndDetails = arrayFromPlist
                }
            }
        }
         
            NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(notification:)), name: UIApplication.willResignActiveNotification, object:nil)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc
    func insertNewObject(_ sender: Any) {
        taskAndDetails.insert(["Title": "New Item"], at: 0)
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
        return taskAndDetails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = taskAndDetails[indexPath.row]["Title"]
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
        let itemToMove = taskAndDetails[sourceIndexPath.row]
        taskAndDetails.remove(at: sourceIndexPath.row)
        taskAndDetails.insert(itemToMove, at: destinationIndexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskAndDetails.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //Data URL
    func dataFileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url: URL?
        url = URL(fileURLWithPath: "")
        
        //Give the file a name. Changed to data.plist per description in assignment.
        url = urls.first!.appendingPathComponent("data.plist")
        return url!
    }

    //When app is closed, save the data to the file
    @objc func applicationWillResignActive(notification: NSNotification) {
        print("Data saved to file")
        let fileURL = self.dataFileURL()
        let array = (self.taskAndDetails as NSArray)
        array.write(to: fileURL as URL, atomically: true)
    }

}

