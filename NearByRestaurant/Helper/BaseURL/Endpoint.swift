//
//  Endpoint.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

enum EndPointRouter {
    case all
}

final class EndPointUtility {
    static let baseEndpoint = "https://foodbukka.herokuapp.com/api"
    static let apiVersion = "v1"
    
    static func url(forEnvironment: EnvironmentType = Environment.current(), endPoint: EndPointRouter) -> String? {
        
        switch endPoint {
            case .all:
                return baseEndpoint + "/\(apiVersion)/" + "restaurant"
        }
        
    }
}
