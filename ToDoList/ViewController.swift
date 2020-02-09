//
//  ViewController.swift
//  ToDoList
//
//  Created by Kim Yeon Jeong on 2020/2/8.
//  Copyright © 2020 Kim Yeon Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AddTask, CheckBox {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Tasks] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
            
            cell.taskNameLabel.text = tasks[indexPath.row].name
            
            if tasks[indexPath.row].checked {
                cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControl.State.normal)
            } else {
                cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControl.State.normal)
            }
            
            cell.delegate = self
            cell.tasks = tasks
            cell.indexP = indexPath.row
            
            return cell
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }

    func addTask(name: String) {
        tasks.append(Tasks(name: name))
        tableView.reloadData()
    }
    
    func checkBox(state: Bool, index: Int?) {
        tasks[index!].checked = state
        tableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableView.RowAnimation.none)
    }
}

class Tasks {
    var name = ""
    var checked = false
    
    convenience init (name: String) {
        self.init()
        self.name = name
    }
}


