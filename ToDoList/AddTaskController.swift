//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Kim Yeon Jeong on 2020/2/9.
//  Copyright © 2020 Kim Yeon Jeong. All rights reserved.
//

import Foundation
import UIKit

protocol AddTask {
    func addTask(name: String)
}

class AddTaskController: UIViewController {
   @IBAction func addAction(_ sender: Any) {
        if nameTextField.text != "" {
            delegate?.addTask(name: nameTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
