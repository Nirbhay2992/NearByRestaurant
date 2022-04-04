//
//  LoginTextFieldVarificationManager.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation

// Validate the text fields of Login screen
struct LoginTextFieldVarificationManager {
    //MARK: Properties
    let emailID: String!
    let password: String!
    
    init?(mailID: String?, password: String?) throws {
    
        guard let mailID = mailID,
              let password = password
        else {
             throw ValidationError.allFieldsAreEmpty
        }

        self.emailID = mailID
        self.password = password
    }    
    
    /**
     To validate the user email id and password
     */
    func validate() throws {
        do {
            try validateEmailID()
            try validatePassword()
        }
        catch let error {
            throw error
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func validateEmailID() throws {
        if let emailID = emailID {
            // Should not be empty
            guard !emailID.isEmpty else {
                throw ValidationError.empty("Email ID")
            }
            
            if !isValidEmail(emailID) {
                throw ValidationError.invalidCharacterFound("special symbols")
            }
        }
    }
    
    private func validatePassword() throws {
        if let password = password {
            // Should not be empty
            guard !password.isEmpty else {
                throw ValidationError.empty("Password")
            }
        }
    }
}
