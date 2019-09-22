//
//  Contact.swift
//  ContactBook
//
//  Created by Dimash on 9/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

struct Contact {
    var name: String
    var phoneNumber: String
    var gender: String
    
    init(_ name: String, _ phoneNumber: String, _ gender: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.gender = gender
    }
    
}

extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return
                lhs.name == rhs.name &&
                lhs.phoneNumber == rhs.phoneNumber &&
                lhs.gender == rhs.gender
    }
}
