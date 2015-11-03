//
//  ViewController.swift
//  LocateMyCar
//
//  Created by Michael Reynolds on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// NSCoding Constants
let kLocationsKey = "locations"

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var locations: [Location]?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureLocationManager()
        currentLocationButton.enabled = false
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
//        geocoder.geocodeAddressString("Lakeland, FL", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//            if let placemark = placemarks?[0]
//            {
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = (placemark.location?.coordinate)!
//                annotation.title = "Lakeland, FL"
//                self.mapView.addAnnotation(annotation)
//            }
//        })

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
                currentLocationButton.enabled = true
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true

            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            currentLocationButton.enabled = true
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true

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
                let name = placemark?[0].locality
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                let aPin = Location(name: name!, lat: lat!, lng: lng!)
                self.locationWasPinned(aPin)
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

            }
        })
    }
    
    func locationWasPinned(aPin: Location)
    {
        if locations == nil
        {
            locations = [Location]()
        }
        else
        {
            locations?.append(aPin)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = aPin.latitude
            annotation.coordinate.longitude = aPin.longitude
            annotation.title = aPin.name
            
            mapView.showAnnotations([annotation], animated: true)
        }
    }

    func updateMapLocation()
    {
//        switch
//        {
//            if case
//        }
    }
    
    // MARK: - Action Handlers
    
    @IBAction func useLocationTapped(sender: UIButton)
    {
        locationManager.startUpdatingLocation()
    }



}

