//
//  ModalViewController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    var delegate: ModalViewControllerProtocol?
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        zipcodeTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        if zipcodeTextField != ""
        {
            delegate?.returnKeyWasPressed(zipcodeTextField.text!)
            rc = true
        }
        return rc
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Action Handlers
    
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem)
    {
        delegate?.cancelButtonPressed(sender)
    }
    
    @IBAction func searchButtonPressed(sender: UIBarButtonItem)
    {
        if zipcodeTextField.text != ""
        {
            delegate?.zipcodeWasEntered(zipcodeTextField.text!)

        }
    }
}
