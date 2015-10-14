//
//  HeroDetailViewController.swift
//  S.H.I.E.L.D Hero Tracker
//
//  Created by Michael Reynolds on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{
    var hero: Hero?
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var homeworldLabel: UILabel!
    
    @IBOutlet weak var powersLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = hero?.name
        homeworldLabel.text = hero?.homeworld
        powersLabel.text = hero?.powers
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
