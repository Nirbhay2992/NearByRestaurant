//
//  LoginViewModel.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit

class LoginViewModel {
    
    func performLogin(emailID: String?, password: String?, completion:@escaping (_ error: Error?)-> Void) {
        
        do {
            let textFieldManager = try LoginTextFieldVarificationManager(mailID: emailID, password: password)
            try textFieldManager?.validate()
            completion(nil)
        }
        catch let error {
            completion(error)
        }
        
    }
}
