//
//  EnterNameViewController.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class EnterNameVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    var delegate: EnterNameVCProtocol?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        alertLabel.text = ""
        
        let font = UIFont(name: "HelveticaNeue-UltraLight", size: 44)!
        let attributes = [
            NSForegroundColorAttributeName: UIColor.greenColor(),
            NSFontAttributeName : font]
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Begin typing your name now",
            attributes:attributes)
        
        nameTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTextField(textField: String) -> Bool
    {
        let characterSet = NSCharacterSet(charactersInString: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if textField.rangeOfCharacterFromSet(characterSet)?.count == 1
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
        
        if nameTextField != ""
        {
            if validateTextField(textField.text!) == true
            {
                alertLabel.text = ""
                delegate?.nextKeyWasPressed(nameTextField.text!)
                rc = true
            }
            else
            {
                alertLabel.text = "Please enter your name in order to continue"
            }
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

}
