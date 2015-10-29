//
//  ViewController.swift
//  MuttCuts
//
//  Created by Michael Reynolds on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol CityStateViewControllerDelegate
{
    func locationWasEntered(cities: [String])
}

class MapViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate, CityStateViewControllerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
// need to import MapKit to use anything with "MK" 
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString("Portland, OR", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//            if let placemark = placemarks?[0]
//            {
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = (placemark.location?.coordinate)!
//                annotation.title = "Portland, OR"
//                self.mapView.addAnnotation(annotation)
//                
//            }
//        })
    }
    
    
    
    
//        let tiyOrlando = CLLocationCoordinate2DMake(28.540923, -81.38216)
//        //need to import CoreLocation for this
//        let tiyOrlandoAnnotation = MKPointAnnotation()
//        tiyOrlandoAnnotation.coordinate = tiyOrlando
//        tiyOrlandoAnnotation.title = "The Iron Yard"
//        tiyOrlandoAnnotation.subtitle = "Orlando"
        
//        let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
//        //need to import CoreLocation for this
//        let tiyTampaAnnotation = MKPointAnnotation()
//        tiyTampaAnnotation.coordinate = tiyTampa
//        tiyTampaAnnotation.title = "The Iron Yard"
//        tiyTampaAnnotation.subtitle = "Tampa"
        
//        let annotations = [tiyOrlandoAnnotation, tiyTampaAnnotation]
//        mapView.addAnnotations(annotations)
//        mapView.showAnnotations(annotations, animated: true)
//        mapView.camera.altitude *= 2
        
//        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
//        mapView.setRegion(viewRegion, animated: true)
    
//        let orlandoLocation = CLLocation(coordinate: tiyOrlando, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
//        let tampaLocation = CLLocation(coordinate: tiyTampa, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
//        let lineOfSightDistance = orlandoLocation.distanceFromLocation(tampaLocation)
//        print("distance between \(tiyOrlandoAnnotation.subtitle!) and \(tiyTampaAnnotation.subtitle!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "CityStateSegue"
        {
            let destVC = segue.destinationViewController as! CityStateViewController
//            destVC.characters = remainingCharacters
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self //connects
//            let contentHeight = 44.0 * CGFloat(remainingCharacters.count)
//            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }
    }
    
    // MARK: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
        //can also just type return .None
    }
    
    // MARK: - TextField Delegate
    
    func locationWasEntered(cities: [String])
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        for _ in cities
        {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString("_", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks?[0]
                {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (placemark.location?.coordinate)!
                    annotation.title = "_"
                    self.mapView.addAnnotation(annotation)
                    
                }
            })
        }

    }


}

