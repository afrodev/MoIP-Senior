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
        controller.login(username: "integracao@labs.moip.com.br", password: "testemoip")
        
    }
    
    func finishLogin(access_token: String) {
        let orderVC = OrdersTableViewController()
        orderVC.access_token = access_token
        
        self.present(orderVC, animated: true, completion: nil)
        
    }



    

}
