//
//  kNetwork.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}


enum ResponseType {
    case success
    case error
    case noResponse
    
    private static let successCodes: Range<Int> = 200..<299
    
    static func from(response: HTTPURLResponse?) -> ResponseType {
        guard let response = response else {
            return .noResponse
        }
        return (ResponseType.successCodes.contains(response.statusCode) ? .success : .error)
    }
}

typealias NetworkCompletion = (_ response: ResponseProtocol?, _ error: Error?) -> Void
