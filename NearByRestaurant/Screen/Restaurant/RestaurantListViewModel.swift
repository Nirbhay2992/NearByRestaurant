//
//  RestaurantListViewModel.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

class RestaurantListViewModel {
    
    let service: Service
    var reloadTableView: (()->Void)?

    private(set) var restaurents: [Restaurant]? {
        didSet {
            reloadTableView?()
        }
    }
    
    init(service: Service) {
        self.service = service
        restaurents = []
    }
    
    func getRestaurantList() {
        let request = ServiceUtility.restaurantAllListRequest
        
        service.execute(request: request) { [weak self] response, error in
            
            if error != nil {
                // Handle Error
            } else if let data = response?.data {
                do {
                    let restaurantList = try DecoderManager.decode(type: Restaurants.self, data: data)
                    self?.restaurents = restaurantList?.result
                }
                catch {
                    self?.restaurents = []
                    print("Error: Error in decoding")
                }
            }
        }
    }
    
    func getCellViewModel(indexPath: IndexPath) -> RestaurantCellViewModel? {
        guard let restaurent = getRestaurant(atIndexPath: indexPath) else { return nil }
        return RestaurantCellViewModel(restaurant: restaurent)
    }
    
    func getRestaurant(atIndexPath: IndexPath) -> Restaurant? {
        guard atIndexPath.section < restaurents?.count ?? 0 else { return nil }
        return restaurents?[atIndexPath.section]
    }

    
}
