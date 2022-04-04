//
//  TextFieldError.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

enum ValidationError : Error {
    case allFieldsAreEmpty
    case invalid(String)
    case empty(String)
    case invalidCharacterFound(String)
}

extension ValidationError : LocalizedError {
    var errorDescription: String? {
        switch self {
            case .empty(let field):
                return NSLocalizedString("\(field) should not be empty.", comment: "")
            
            case .invalid(let value):
                let format = NSLocalizedString(
                    "'%@' is invalid.", comment: ""
                )
                return String(format: format, value)
            
            case .invalidCharacterFound(let character):
                let format = NSLocalizedString(
                    "Your email id can't contain the '%@'.",
                    comment: ""
                )
                return String(format: format, String(character))
            case .allFieldsAreEmpty:
                return NSLocalizedString("EmailID and password should not be empty.", comment: "")
        }
    }
}
