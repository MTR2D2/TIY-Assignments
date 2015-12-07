////
////  EnterNameViewController.swift
////  BuiltBeautiful
////
////  Created by Michael Reynolds on 12/6/15.
////  Copyright © 2015 The Iron Yard. All rights reserved.
////
//
//import UIKit
//var name: String?
//
//class EnterNameVC: UIViewController, UITextFieldDelegate
//{
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var alertLabel: UILabel!
//    
//    var delegate: EnterNameVCProtocol?
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//        alertLabel.text = ""
//        
//        nameTextField.delegate = self
//        
////        let font = UIFont(name: "HelveticaNeue-UltraLight", size: 44)!
////        let attributes = [
////            NSForegroundColorAttributeName: UIColor.greenColor(),
////            NSFontAttributeName : font]
////        
////        nameTextField.attributedPlaceholder = NSAttributedString(string: "Begin typing your name now",
////            attributes:attributes)
////        
////        nameTextField.font = font
//        
//        nameTextField.becomeFirstResponder()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
////    override func viewWillDisappear(animated: Bool)
////    {
////        super.viewWillDisappear(animated)
////        
////        delegate?.nextKeyWasPressed()
////    }
//    
//    func validateTextField(textField: String) -> Bool
//    {
//        let characterSet = NSCharacterSet(charactersInString: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
//        if textField.rangeOfCharacterFromSet(characterSet)?.count == 1
//        {
//            return true
//        }
//        else
//        {
//            return false
//        }
//        
//    }
//    func textFieldShouldReturn(textField: UITextField) -> Bool
//    {
//        var rc = false
//        
//        if nameTextField != ""
//        {
//            if validateTextField(textField.text!) == true
//            {
//                alertLabel.text = ""
//                delegate?.nextKeyWasPressed(nameTextField.text!)
//                
//                getName()
//                
//                nameTextField.resignFirstResponder()
//                
//                rc = true
//               
//            }
//            else
//            {
//                alertLabel.text = "Please enter your name in order to continue"
//            }
//        }
//        return rc
//    }
//
//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    {
//        if segue.identifier == "EnterNameSegue"
//        {
//        }
//    }
//    
//    @IBAction func nextTapped(sender: UIButton)
//    {
//        getName()
//        
//        delegate?.nextKeyWasPressed(nameTextField.text!)
//    }
//    
//    func getName()
//    {
//        if nameTextField.text != ""
//        {
//            let enteredName = nameTextField.text!
//            name = String(enteredName)
//        }
//    }
//
//}
