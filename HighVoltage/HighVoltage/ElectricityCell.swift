//
//  ElectricityCell.swift
//  HighVoltage
//
//  Created by Michael Reynolds on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ElectricityCell: UITableViewCell
{
    @IBOutlet weak var valueLabel: UILabel!

    @IBOutlet weak var textFieldLabel: UITextField!
    
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
