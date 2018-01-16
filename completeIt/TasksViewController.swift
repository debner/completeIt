//
//  TasksViewController.swift
//  completeIt
//
//  Created by Daniel Debner on 1/15/18.
//  Copyright © 2018 Daniel Debner. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var taskTable: UITableView!
	
	var tasks : [Task] = []
	var selectedIndex = 0
	
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		selectedIndex = indexPath.row
		
		let task = tasks[indexPath.row]
		performSegue(withIdentifier: "selectTaskSegue", sender: task)
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
	
	@IBAction func plusTapped(_ sender: Any) {
		performSegue(withIdentifier: "plusSegue", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "plusSegue" {
		let nextVC = segue.destination as! CreateTaskViewController // 'as!' specifies the exact view controller, we know that previous.VC is a var on the CTVC
		nextVC.previousVC = self
		}
		
		if segue.identifier == "selectTaskSegue" {
			let nextVC = segue.destination as! CompleteTaskViewController
			nextVC.task = sender as! Task
			nextVC.previousVC = self
	}
	
}

}
