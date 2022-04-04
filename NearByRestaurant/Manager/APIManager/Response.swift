//
//  Response.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class Response: ResponseProtocol {
    var type: ResponseType
    var request: RequestProtocol
    var data: Data
    
    required init(type: ResponseType, request: RequestProtocol, data: Data){
        self.type = type
        self.request = request
        self.data = data
    }
    
}
