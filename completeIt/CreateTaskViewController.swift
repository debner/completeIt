//
//  CreateTaskViewController.swift
//  completeIt
//
//  Created by Daniel Debner on 1/16/18.
//  Copyright © 2018 Daniel Debner. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
	@IBOutlet weak var taskNameTextField: UITextField!
	@IBOutlet weak var importantSwitch: UISwitch!
	
	var previousVC = TasksViewController()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func addTapped(_ sender: Any) {
		
		// Create a task from the outlet information
		
		let task = Task()

		task.name = taskNameTextField.text!
		task.important = importantSwitch.isOn
		
		//Add new task to array in previous viewController
		
		previousVC.tasks.append(task)
		previousVC.taskTable.reloadData()
		navigationController!.popViewController(animated: true)
	}
	
	
}
