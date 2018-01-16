//
//  CompleteTaskViewController.swift
//  completeIt
//
//  Created by Daniel Debner on 1/16/18.
//  Copyright © 2018 Daniel Debner. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

	@IBOutlet weak var taskLabel: UILabel!
	var task = Task()
	var previousVC = TasksViewController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if task.important {
			taskLabel.text = "❗️\(task.name)"
		} else {
			taskLabel.text = task.name
		}

        // Do any additional setup after loading the view.
    }
	@IBAction func completeTapped(_ sender: Any) {
		previousVC.tasks.remove(at: previousVC.selectedIndex)
		previousVC.taskTable.reloadData()
		navigationController!.popViewController(animated: true)
	}
	

}
