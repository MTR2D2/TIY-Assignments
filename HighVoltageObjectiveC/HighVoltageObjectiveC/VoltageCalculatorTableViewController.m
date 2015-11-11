//
//  VoltageCalculatorTableViewController.m
//  HighVoltageObjectiveC
//
//  Created by Michael Reynolds on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "VoltageCalculatorTableViewController.h"
#import "ValuesTypesTableViewController.h"
#import "ElectricityCell.h"

@interface VoltageCalculatorTableViewController ()
{
    NSArray *allElectricityTypes;
    NSMutableArray *shownElectricityTypes;
    NSMutableArray *remainingElectrictyTypes;
}

@property (weak, nonatomic) IBOutlet UITextField *currentTextField;




@end



@implementation VoltageCalculatorTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   self.title = @"High Voltage";
    allElectricityTypes = @[@"AMPS", @"WATTS", @"VOLTS", @"OHMS"];
    remainingElectrictyTypes = [[NSMutableArray alloc] initWithArray:allElectricityTypes];
    shownElectricityTypes = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [shownElectricityTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResistanceCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ValuesTypesTableViewController *valuesVC = segue.destinationViewController;
    UIPopoverPresentationController *controller = valuesVC.popoverPresentationController;
    controller.delegate = self;
    valuesVC.delegate = self;
    
    valuesVC.valueTypes = remainingElectrictyTypes;
    
    
    valuesVC.modalPresentationStyle = UIModalPresentationPopover;
    valuesVC.preferredContentSize = CGSizeMake(400, 200);
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}
#pragma mark - Value Type Delegate

- (void)valueTypeWasChosen:(NSString *)chosenValueType;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
