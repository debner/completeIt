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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// tasks = makeTasks() // Before dataSource/delegate because when you give taskTable the search, it begins looking
		
		taskTable.dataSource = self
		taskTable.delegate = self
		
	}
	
	override func viewWillAppear(_ animated: Bool) { // gets run when VC is called upon the screen
		getTasks()
		taskTable.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let task = tasks[indexPath.row]
		if task.important {
			cell.textLabel?.text = "❗️\(task.name!)"
		} else {
			cell.textLabel?.text = task.name!
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let task = tasks[indexPath.row]
		performSegue(withIdentifier: "selectTaskSegue", sender: task)
	}
	
	@IBAction func plusTapped(_ sender: Any) {
		performSegue(withIdentifier: "plusSegue", sender: nil)
	}
	
	func getTasks() {
		let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
		do { // do & catch
		tasks = try context.fetch(Task.fetchRequest()) as! [Task] // try is needed in a do and catch for error throwing items, if error occurs, catch is run
		} catch {
			print("ERROR")
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "plusSegue" {
		}
		
		if segue.identifier == "selectTaskSegue" {
			let nextVC = segue.destination as! CompleteTaskViewController
			nextVC.task = sender as? Task
	}
	
}

}
