//
//  DataManager.swift
//  Places
//
//  Created by Dimash on 10/31/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

class DataManager {
    static var places = [Place]()
    static func add(_ place: Place) {
        places.append(place)
    }
}
