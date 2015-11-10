//
//  Ticket.h
//  Jackpot Redux
//
//  Created by Michael Reynolds on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (nonatomic) NSArray *numbers;
@property (nonatomic) NSArray *winningNumbers;

+ (Ticket *)makeTicket;

@end
