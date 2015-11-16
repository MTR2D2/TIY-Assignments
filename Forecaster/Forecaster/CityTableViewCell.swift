//
//  CityTableViewCell.swift
//  Forecaster
//
//  Created by Michael Reynolds on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell
{

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
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
