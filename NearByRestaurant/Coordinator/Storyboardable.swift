//
//  StoryBoardable.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 30/04/22.
//

import Foundation
import UIKit

protocol Storyboardable: AnyObject {
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: id)
        return viewController as! Self
    }
}
