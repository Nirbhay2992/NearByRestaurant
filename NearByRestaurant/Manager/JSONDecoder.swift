//
//  JSONDecoder.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class DecoderManager {
    
    static func decodeAsArray<T: Codable> (type: T.Type, data: Data) throws -> [T]? {
        do {
            let decoded:[T] = try JSONDecoder().decode([T].self, from: data)
            return decoded
        }
        catch {
            return nil
        }
    }
    
    static func decode<T: Decodable> (type: T.Type, data: Data) throws -> T? {
        do {
            let decoded:T = try JSONDecoder().decode(T.self, from: data)
            return decoded
        }
        catch {
            return nil
        }
    }
}
