//
//  JSONFileHelper.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import XCTest
@testable import NearByRestaurant

final class JSONFileHelper: XCTestCase {

    class func data(fromFile: String, bundleSource: XCTestCase) -> Data? {
        var jsonData: Data?
        let testBundle = Bundle(for: type(of: bundleSource))
        let filePath = testBundle.url(forResource: fromFile, withExtension: "json")
        
        if let path = filePath, let data = try? Data(contentsOf: path) {
            jsonData = data
        }
        
        return jsonData
    }
    
}
