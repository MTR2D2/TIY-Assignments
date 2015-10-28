//
//  CityStateViewController.swift
//  MuttCuts
//
//  Created by Michael Reynolds on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CityStateViewController: UIViewController
{
    var delegate: CityStateViewControllerDelegate?

    @IBOutlet weak var cityState1TextField: UITextField!
    @IBOutlet weak var cityState2TextField: UITextField!
    
    let textFieldDelegation = TextFieldDelegation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        switch textField
        {
        case cityState1TextField:
            if textFieldDelegation.validateCityState1(textField.text!)
            {
                cityState2TextField.becomeFirstResponder()
            }
        case cityState2TextField:
            if textFieldDelegation.validateCityState2(textField.text!)
            {
                cityState2TextField.resignFirstResponder()
            }
        default:
            textField.resignFirstResponder()
            
        }
        return true
    }
    
    // MARK - Action Handlers
    
    @IBAction func searchButton(sender: UIButton)
    {
        
    }
}
