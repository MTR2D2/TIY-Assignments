//
//  VoltageCalculatorTableViewController.h
//  HighVoltageObjectiveC
//
//  Created by Michael Reynolds on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ValueProtocol

- (void)valueTypeWasChosen:(NSString *)chosenValueType;

@end

@interface VoltageCalculatorTableViewController : UITableViewController <ValueProtocol, UIPopoverPresentationControllerDelegate>



@end
