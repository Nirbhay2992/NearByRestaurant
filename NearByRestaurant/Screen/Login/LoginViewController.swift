//
//  ViewController.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit

class LoginViewController: BaseViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: Properties
    private var viewModel: LoginViewModel?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }

    // MARK: IBAction
    @IBAction func didTouchLoginButton(_ sender: UIButton) {
        
        viewModel?.performLogin(emailID: emailTextField.text, password: passwordTextField.text, completion: { [weak self] error in
            
            if let error = error {
                // Show error message
                self?.show(message: error.localizedDescription)
                return
            }
          
            self?.performSegue(withIdentifier: SegueIdentifier.loginToRestaurantListing, sender: nil)
        })
    }
    
}

private extension LoginViewController {
    
    func configureViewModel() {
        viewModel = LoginViewModel()
    }
}

