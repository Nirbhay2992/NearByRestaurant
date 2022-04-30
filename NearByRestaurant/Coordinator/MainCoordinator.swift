//
//  MainCoordinator.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 30/04/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childrenCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showRestaurant() {
        let vc = RestaurantListViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

}
