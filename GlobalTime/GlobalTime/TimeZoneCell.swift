//
//  TimeZoneCell.swift
//  GlobalTime
//
//  Created by Michael Reynolds on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeZoneCell: UITableViewCell
{
    @IBOutlet weak var clock: UIView!
    @IBOutlet weak var zoneLabel: UILabel!

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
