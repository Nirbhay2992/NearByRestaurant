//
//  Restaurant.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

// MARK: - Restaurants
struct Restaurants: Codable {
    let totalRestaurants: Int?
    let result: [Restaurant]?

    enum CodingKeys: String, CodingKey {
        case totalRestaurants = "Total Restaurants"
        case result = "Result"
    }
}

// MARK: - Result
struct Restaurant: Codable {
    let reviews: Int?
    let parkinglot: Bool?
    let location, phone: String?
    let averagecost: Int?
    let image: String?
    let imageID: String?
    let restauranttype: Restauranttype?
    let id, businessname, address, menu: String?
    let slug, email: String?
    let v: Int?
    let resultID: String?
    let website: String?

    enum CodingKeys: String, CodingKey {
        case reviews, parkinglot, location, phone, averagecost, image
        case imageID = "imageId"
        case restauranttype
        case id = "_id"
        case businessname, address, menu, slug, email
        case v = "__v"
        case resultID = "id"
        case website
    }
}

enum Restauranttype: String, Codable {
    case bukka = "bukka"
    case canteen = "canteen"
    case eatery = "eatery"
    case japanese = "japanese"
}

