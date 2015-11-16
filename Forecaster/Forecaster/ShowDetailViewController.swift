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
    var city: City?
    var weather = WeatherConditions!()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureDescriptionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        if city.weather != nil
//        {
        temperatureDescriptionLabel.text = "The Temperature in \(city!.cityName) is:"
        temperatureLabel.text = "\(city!.weather!.temperature)℉"
        feelsLikeLabel.text = "\(city!.weather!.feelsLike)℉"
        imageView.image = UIImage(named: "\(city!.weather!.icon)")
        print(city!.weather!.icon)

        let color = UIColor(hue: 0.166, saturation: 0.5, brightness: 1.0, alpha: 0.0)
        navigationController?.navigationBar.barTintColor = color
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
