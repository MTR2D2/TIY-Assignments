//
//  Extensions.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 12/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

extension UIImageView
{
    func downloadImageFrom(imageURL: String)
    {
        let formattedImageURL = imageURL.stringByReplacingOccurrencesOfString("\\", withString: "")
        
        if let URL = NSURL(string: formattedImageURL)
        {
            let task = NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler:
            { (imageData, _, error) -> Void in
                
                if imageData != nil
                {
                    if let image = UIImage(data: imageData!)
                    {
                        self.contentMode = .ScaleToFill
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.image = image
                        })
                    }
                    
                    
                }
                else
                {
                    print(error?.localizedDescription)
//                    self.image = UIImage(named: "na.png")
                }
            })//.resume()
            
            task.resume()
        }
        else
        {
            print("URL was invalid \(imageURL)")
        }
    }
}