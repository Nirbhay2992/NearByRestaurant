//
//  Request.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class Request: RequestProtocol {

    var route: EndPointRouter
    var httpMethod: HTTPMethod

    required init(route: EndPointRouter, httpMethod: HTTPMethod) {
        self.route = route
        self.httpMethod = httpMethod
    }
    
}
