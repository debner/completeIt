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
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func addTapped(_ sender: Any) {
		
		// Create a task from the outlet information
		
		let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
		
		let task = Task(context: context)

		task.name = taskNameTextField.text!
		task.important = importantSwitch.isOn
		
		// context.save introduces some problems, savecontext is what we want
		(UIApplication.shared.delegate as! AppDelegate).saveContext()
		
		// pop back to homepage
		
		navigationController!.popViewController(animated: true)
	}
	
	
}
