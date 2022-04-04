//
//  ServiceUtilty.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class ServiceUtility {
    
    static var restaurantAllListRequest: Request {
        return Request(route: .all, httpMethod: .GET)
    }
}
