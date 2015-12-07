//
//  ChooseViewController.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import QuartzCore

protocol EnterNameVCProtocol
{
    func nextKeyWasPressed(nameText: String)
}

class ChooseVC: UIViewController, UIPopoverPresentationControllerDelegate, EnterNameVCProtocol
{
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var myBudgetsButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.incomeButton.layer.cornerRadius = 8
        self.expenseButton.layer.cornerRadius = 8
        self.myBudgetsButton.layer.cornerRadius = 8

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
        //can also just type: return .None
    }
    
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
    
    func nextKeyWasPressed(nameText: String)
    {
        userLabel.text = "Hello, \(nameText) )"
        self.dismissViewControllerAnimated(true, completion: nil)
        print(nameText)
    }
    
    

  

}
