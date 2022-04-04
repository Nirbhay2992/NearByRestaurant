//
//  Environment.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

enum EnvironmentType {
    case development
    case production
}

struct Environment {
    
    static func current() -> EnvironmentType {
        .development
    }
}
