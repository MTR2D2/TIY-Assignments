//
//  APIController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
}
