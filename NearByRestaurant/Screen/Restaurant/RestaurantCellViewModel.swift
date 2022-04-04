//
//  CountryCellViewModel.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class RestaurantCellViewModel {
    
    private(set) var name: String
    private(set) var address: String
    private(set) var reviews: String?
    private(set) var restaurant: Restaurant
    private(set) var restaurantImageUrl: String
 
    init(name: String, address: String, reviews: String?, restaurantImageUrl: String, restaurant: Restaurant) {
        self.name = name
        self.address = address
        self.reviews = reviews
        self.restaurant = restaurant
        self.restaurantImageUrl = restaurantImageUrl
    }
    
    convenience init(restaurant: Restaurant) {
        let name = restaurant.businessname?.capitalized ?? ""
        let address = restaurant.address ?? ""
        let reviews = "Review: \(restaurant.reviews ?? 0)"
        let restaurantImageUrl = restaurant.image ?? ""
        self.init(name: name, address: address, reviews: reviews, restaurantImageUrl: restaurantImageUrl, restaurant: restaurant)
    }
}

