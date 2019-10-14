//
//  Time.swift
//  Alarm
//
//  Created by Dimash on 10/14/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

struct Time: CustomStringConvertible {
    var hour: Int
    var minute: Int
    
    var description: String {
        return "\(hour):\(minute)"
    }
    
}
