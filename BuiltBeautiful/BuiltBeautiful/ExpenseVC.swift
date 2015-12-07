//
//  ExpenseViewController.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ExpenseVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var myBudgetButton: UIButton!

    
//    var delegate: ExpenseViewControllerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.myBudgetButton.layer.cornerRadius = 8
        
        expenseTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return true
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
