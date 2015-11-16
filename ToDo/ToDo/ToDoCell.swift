//
//  ToDoCell.swift
//  ToDo
//
//  Created by Michael Reynolds on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell
{

    @IBOutlet weak var toDoText: UITextField!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
