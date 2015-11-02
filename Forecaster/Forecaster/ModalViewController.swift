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
    @IBOutlet weak var alertLabel: UILabel!
    
    var delegate: ModalViewControllerProtocol?
    
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        zipcodeTextField.becomeFirstResponder()
        alertLabel.text = ""

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
            self.dismissViewControllerAnimated(true, completion: nil)

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