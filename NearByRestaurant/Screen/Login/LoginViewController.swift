//
//  ViewController.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit

class LoginViewController: BaseViewController, Storyboardable {

    // MARK: IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: Properties
    private var viewModel: LoginViewModel?
    weak var coordinator: MainCoordinator?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "nirbhay2992@gmail.com"
        passwordTextField.text = "12345"
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
            self?.coordinator?.showRestaurant()
        })
    }
    
}

private extension LoginViewController {
    
    func configureViewModel() {
        viewModel = LoginViewModel()
    }
}

