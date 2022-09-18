//
//  DetailViewController.swift
//  masterDetailTemplateXCode11
//
//  Created by R.O. Chapman on 11/18/20.
//  Copyright © 2020 R.O. Chapman. All rights reserved.
//
//  Updated by George Martin on 07/12/22 for functionality
//  Auburn University, Summer 2022, COMP 5970
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionTextField: UITextField!
    
    @IBOutlet weak var detailItemsTextField: UITextView!
    
    
    var masterController: MasterViewController!
    
    func configureView() {
        detailDescriptionTextField.text = masterController.taskAndDetails[masterController.selectedItem]["Title"]
        detailItemsTextField.text = masterController.taskAndDetails[masterController.selectedItem]["Detail"]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureView();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        title = "Detail View"
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //This may be redundant, but there were issues with implementing buttons using main.storyboard
        
        //Create cancel button on left of detail view
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButton(_:)))
        navigationItem.leftBarButtonItem = cancelBtn
        
        //Create save button on right of detail view
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton(_:)))
        navigationItem.rightBarButtonItem = saveBtn
        
    }
    
    //If cancel button is pressed, remove any empty rows and segue back
    @objc func cancelButton(_ sender: Any) {
        if masterController.tableView.indexPathForSelectedRow == nil {
            masterController.taskAndDetails.remove(at: 0)
        }
        performSegue(withIdentifier:"goBack", sender: self )
    }
    
    //If save button is pressed, segue back
    @objc func saveButton(_ sender: Any) {
        
        //If title is left empty, save as "New Item"
        if(detailDescriptionTextField!.text == "") {
            
            masterController.taskAndDetails[masterController.selectedItem]["Title"] = "New Item"
            masterController.taskAndDetails[masterController.selectedItem]["Detail"] = detailItemsTextField!.text ?? ""
            
            //If title is left empty, don't save
            //masterController.tasks.remove(at: 0)
            //masterController.TaskName.remove(at: 0)
        }
        else {
            masterController.taskAndDetails[masterController.selectedItem]["Title"] = detailDescriptionTextField!.text!
        masterController.taskAndDetails[masterController.selectedItem]["Detail"] = detailItemsTextField!.text ?? ""
        }
        performSegue(withIdentifier:"goBack", sender: self )
        
    }
}

