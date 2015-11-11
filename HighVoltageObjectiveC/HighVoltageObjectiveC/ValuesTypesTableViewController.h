//
//  ValuesTypesTableViewController.h
//  HighVoltageObjectiveC
//
//  Created by Michael Reynolds on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageCalculatorTableViewController.h"

@interface ValuesTypesTableViewController : UITableViewController

@property (nonatomic) id<ValueProtocol> delegate;
@property (nonatomic) NSMutableArray *valueTypes;
@end
