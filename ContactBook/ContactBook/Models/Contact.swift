//
//  Contact.swift
//  ContactBook
//
//  Created by Dimash on 9/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

struct Contact {
    let name: String
    let phoneNumber: String
    let gender: String
    
    init(_ name: String, _ phoneNumber: String, _ gender: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.gender = gender
    }
    
}
