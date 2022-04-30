//
//  CoordinatorProtocol.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 30/04/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childrenCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

