//
//  DataManager.swift
//  ContactBook
//
//  Created by Dimash on 9/21/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

class DataManager {
    
    var contacts: [Contact] = [
        Contact.init("Dimash", "+7 778 497 66 89", "male"),
        Contact.init("Alina", "+7 707 131 43 33", "female")
    ]
    
    func add(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(at index: Int) {
        contacts.remove(at: index)
    }
    
    func setContact(at index: Int, to contact: Contact) {
        contacts[index] = contact
    }
    
}
