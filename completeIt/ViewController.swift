//
//  ViewController.swift
//  completeIt
//
//  Created by Daniel Debner on 1/15/18.
//  Copyright © 2018 Daniel Debner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var taskTable: UITableView!
	
	var tasks : [Task] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		tasks = makeTasks() // Before dataSource/delegate because when you give taskTable the search, it begins looking
		
		taskTable.dataSource = self
		taskTable.delegate = self
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let task = tasks[indexPath.row]
		if task.important {
			cell.textLabel?.text = "❗️\(task.name)"
		} else {
			cell.textLabel?.text = task.name
		}
		
		return cell
	}
	
	func makeTasks() -> [Task] {
		let task1 = Task()
		task1.name = "Walk the dog"
		task1.important = false
		
		let task2 = Task()
		task2.name = "Buy cheese"
		task2.important = true
		
		let task3 = Task()
		task3.name = "Mow the lawn"
		task3.important = false
		
		return [task1, task2, task3]
	}
	
	@IBAction func addTask(_ sender: Any) {
		performSegue(withIdentifier: "addSegue", sender: nil)
	}
	
}

