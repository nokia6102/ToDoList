//
//  TeskCell.swift
//  ToDoList
//
//  Created by Kim Yeon Jeong on 2020/2/8.
//  Copyright © 2020 Kim Yeon Jeong. All rights reserved.
//

import UIKit

protocol CheckBox {
    func checkBox(state: Bool, index: Int?)
}

class TaskCell: UITableViewCell {
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked {
            delegate?.checkBox(state: false, index: indexP)
        } else {
            delegate?.checkBox(state: true, index: indexP)
        }
    }
    
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var indexP : Int?
    var delegate : CheckBox?
    var tasks: [Tasks]?
    
}

