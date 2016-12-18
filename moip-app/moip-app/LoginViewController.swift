//
//  ViewController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginProtocol {


    @IBOutlet weak var emailTextfield: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    let controller = LoginController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

        // Dimiss Keyboard touching anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        controller.delegateLogin = self

        emailTextfield.leftImage = UIImage(named: "email-icon")
        passwordTextField.leftImage = UIImage(named: "password-icon")
        
        
        //controller.login(username: "integracao@labs.moip.com.br", password: "testemoip")
    }
    
    func dismissKeyboard() {
        view.endEditing(true)

    }
    
    @IBAction func actionLogin(_ sender: Any) {
        print("Login")
        controller.login("integracao@labs.moip.com.br", password: "testemoip")
        
    }
    
    func finishLogin(_ access_token: String) {
        let orderVC = OrdersTableViewController()
        orderVC.access_token = access_token
        
        let navigationVC = UINavigationController(rootViewController: orderVC)
        self.present(navigationVC, animated: true, completion: nil)
        
    }

 
    
    

}
