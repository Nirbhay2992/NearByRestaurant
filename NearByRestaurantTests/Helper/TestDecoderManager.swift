//
//  TestDecoderManager.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//


import XCTest
@testable import NearByRestaurant

class TestDecoderManager: XCTestCase {
    
    func testDecodeManager() {
        
        let data = JSONFileHelper.data(fromFile: "RestaurantData", bundleSource: self)
        guard let data = data else {
            return
        }
        
        let decodedObject = try? DecoderManager.decode(type: Restaurants.self, data: data)
        
        XCTAssertNotNil(decodedObject)
        XCTAssert((decodedObject)?.result?.count == 63)
        XCTAssert(type(of: decodedObject) == Restaurants?.self, "Type mismatch")
    }

}
