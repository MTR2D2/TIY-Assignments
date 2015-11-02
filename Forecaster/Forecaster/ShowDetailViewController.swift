//
//  ShowDetailViewController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController
{
    var city = City?()
    var weather = WeatherConditions!()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        if city.weather != nil
//        {
            temperatureLabel.text = city!.weather?.temperature
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
//    }

}
