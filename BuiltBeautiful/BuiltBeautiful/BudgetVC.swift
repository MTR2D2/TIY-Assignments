//
//  HomePageViewController.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

//protocol IncomeViewControllerDelegate
//{
//    func valueWasChosen(chosenValue: String)
//}
//
//protocol ExpenseViewControllerDelegate
//{
//    func valueWasChosen(chosenValue: String)
//}


class BudgetVC: UIViewController//, IncomeViewControllerDelegate, ExpenseViewControllerDelegate
{
    
    @IBOutlet weak var newTransactionButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.newTransactionButton.layer.cornerRadius = 8


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func valueWasChosen(chosenValue: String)
    {
        
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
