//
//  VoltagePopoverTableViewCell.h
//  HighVoltageObjectiveC
//
//  Created by Keron Williams on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElectricityCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *currentTextField;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
