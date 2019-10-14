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
    
    static func getTime(from date: Date) -> Time {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        return Time(hour: hour, minute: minute)
    }
}
