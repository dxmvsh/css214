//
//  Program.swift
//  SDU
//
//  Created by Dimash on 10/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

enum ProgramType {
    case bachelors
    case masters
    case phd
}

struct Program {
    var type: ProgramType
    var specialities: [Speciality]
}
