//
//  Numbers.swift
//  Jackpot
//
//  Created by Michael Reynolds on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Numbers
{
    var ticket = Array<Int>()
    
    init()
    {
        for _ in 1...6
        {
            generator()
        }
    }
    func generator()
    {
            var pickFound = false
            repeat
            {
                let aPick = Int(arc4random() % 53 + 1)
                if !ticket.contains(aPick)
            {
                ticket.append(aPick)
                pickFound = true
            }
            
            } while !pickFound
        }
}