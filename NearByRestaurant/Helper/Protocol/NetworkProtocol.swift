//
//  RequestProtocol.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

protocol RequestProtocol {
    var route: EndPointRouter { get }
    var httpMethod: HTTPMethod { get }
}

protocol ResponseProtocol {
    var type: ResponseType { get }
    var request: RequestProtocol { get }
    var data: Data { get }
}

protocol ServiceProtocol {
    func execute(request: RequestProtocol, _ completion: NetworkCompletion?)
    func handleResponse(_ forRequest: RequestProtocol, data: Data, _ completion: NetworkCompletion?)
}




