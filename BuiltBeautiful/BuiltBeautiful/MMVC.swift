//
//  MichaelsMoneyVC.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import QuartzCore

// MARK: - NextVC

class NextVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        if nameTextField.text != ""
        {
            performSegueWithIdentifier("EnterNameSegue", sender: nil)
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "EnterNameSegue"
        {
            let destVC = segue.destinationViewController as? ChooseVC
            destVC?.usersName = nameTextField.text
        }
    }
    
//    func instantiateMyMoneyVC()
//    {
//        let destVC = storyboard?.instantiateViewControllerWithIdentifier("MyMoneyVC") as! MyMoneyVC
//        presentViewController(destVC, animated: true, completion: nil)
//    }
    
}

// MARK: - ChooseVC

class ChooseVC: UIViewController//, UIPopoverPresentationControllerDelegate
{
    
    var usersName: String?
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var myBudgetsButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userLabel.text = "\(usersName!)'s Money"
        
        self.incomeButton.layer.cornerRadius = 8
        self.expenseButton.layer.cornerRadius = 8
        self.myBudgetsButton.layer.cornerRadius = 8
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    //    {
    //        return UIModalPresentationStyle.None
    //        //can also just type: return .None
    //    }
    
    //    override func prepareForIncomeSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    //    {
    //        if segue.identifier == "ValuesPopoverSegue"
    //        {
    //            let destVC = segue.destinationViewController as! IncomeViewController
    //            destVC.values = remainingValues
    //            destVC.popoverPresentationController?.delegate = self
    //            destVC.delegate = self //connects
    //            let contentHeight = 44.0 * CGFloat(remainingValues.count)
    //            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
    //        }
    //    }
    
    //    override func prepareForExpenseSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    //    {
    //        if segue.identifier == "ValuesPopoverSegue"
    //        {
    //            let destVC = segue.destinationViewController as! ExpenseViewController
    //            destVC.values = remainingValues
    //            destVC.popoverPresentationController?.delegate = self
    //            destVC.delegate = self //connects
    //            let contentHeight = 44.0 * CGFloat(remainingValues.count)
    //            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
    //        }
    //    }
    
}

// MARK: - MyMoneyVC

class MyMoneyVC: UIViewController
{
    
    @IBOutlet weak var newTransactionButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.newTransactionButton.layer.cornerRadius = 8
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func myMoneyTapped(sender: UIButton)
    {
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    
}

// MARK: - IncomeVC

class IncomeVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var myBudgetButton: UIButton!
    
    //    var delegate: IncomeViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.myBudgetButton.layer.cornerRadius = 8
        
        incomeTextField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }

}

// MARK: - ExpenseVC

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
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    
}
