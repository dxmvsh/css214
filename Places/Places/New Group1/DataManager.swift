//
//  DataManager.swift
//  Places
//
//  Created by Dimash on 10/31/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

class DataManager {
    static var annotations = [Annotation]()
    static func add(_ annotation: Annotation) {
        annotations.append(annotation)
    }
}
