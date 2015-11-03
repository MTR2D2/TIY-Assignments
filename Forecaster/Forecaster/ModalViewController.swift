//
//  ModalViewController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class ModalViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate
{
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var delegate: ModalViewControllerProtocol?
    
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        zipcodeTextField.becomeFirstResponder()
        alertLabel.text = ""
//        configureLocationManager()
//        currentLocationButton.enabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTextField(textField: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if textField.characters.count == 5 && textField.rangeOfCharacterFromSet(characterSet)?.count == 1
        {
            return true
        }
        else
        {
            return false
        }
 
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipcodeTextField != ""
        {
            if validateTextField(textField.text!) == true
            {
                alertLabel.text = ""
                delegate?.returnKeyWasPressed(zipcodeTextField.text!)
                rc = true
            }
            else
            {
                alertLabel.text = "Please enter valid ZipCode"
            }
        }
        return rc
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
//            currentLocationButton.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let cityName = placemark?[0].locality
                let zipCode = placemark?[0].postalCode
                self.zipcodeTextField.text = zipCode!
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                let aCity = City(cityName: cityName!, zip: zipCode!, latitude: String(lat!), longitude: String(lng!), weather: nil)
                self.delegate?.cityWasFound(aCity)
            }
    
        })
    }

    


    // MARK: Action Handlers
    
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem)
    {
        delegate?.cancelButtonPressed(sender)
    }
    
//    @IBAction func useLocationTapped(sender: UIButton)
//    {
//        locationManager.startUpdatingLocation()
//    }
    
    @IBAction func searchButtonPressed(sender: UIBarButtonItem)
    {
        if zipcodeTextField.text != ""
        {
            if validateTextField(zipcodeTextField.text!) == true
            {
                print(zipcodeTextField.text)
                delegate?.zipcodeWasEntered(zipcodeTextField.text!)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        else
            {
                print("error")
            }
        }
    }
    
    // MARK: - CLLocation related methods
    
    func configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            else
            {
//                currentLocationButton.enabled = true
            }
        }
    }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/