//
//  SiteDetailViewController.swift
//  The Grail Diary
//
//  Created by Michael Reynolds on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class SiteDetailViewController: UICollectionViewController
{
//    var site = Sites?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var built: UILabel!
//    @IBOutlet weak var description: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        name.text = site?.name
//        location.text = site?.location
//        built.text = site?.built

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}