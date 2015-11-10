//
//  Ticket.m
//  Jackpot Redux
//
//  Created by Michael Reynolds on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

+ (Ticket *)makeTicket
{
    Ticket *aTicket = [[Ticket alloc] init];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    int x = 6;
    while (x > 0) {
        int number = arc4random() % 52;
        NSNumber *pick = [NSNumber numberWithInt:number];
        [numbers addObject: pick];
        x -= 1;
    }
    aTicket.numbers = numbers;
    return aTicket;
}


@end
