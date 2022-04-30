//
//  TestCountryListViewModel.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//


import XCTest
@testable import NearByRestaurant

class TestRestaurantListViewModel: XCTestCase {

    func testRestaurantListViewModel() {
        let service = Service()
        let viewModel = RestaurantListViewModel(service: service)
        
        let expectation = XCTestExpectation(description: "Checking Restaurant List API Calling")
        viewModel.getRestaurantList()
        viewModel.reloadTableView = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 6.0)
        
        XCTAssert(viewModel.restaurents?.count ?? 0 == 63 , "GET Restaurant API response does not contains all the Restaurant list")
    }
    
    func testCountryListViewModelWithStoredJSON() {
        let data = JSONFileHelper.data(fromFile: "RestaurantData", bundleSource: self)
        guard let data = data else { return }
        
        let decodedObject:Restaurants? = try? DecoderManager.decode(type: Restaurants.self, data: data)
        
        XCTAssert(decodedObject?.result?.count ?? 0 == 63, "Mismatch")
    }
}
