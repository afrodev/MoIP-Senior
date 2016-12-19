//
//  ViewController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        
        emailTextfield.text = "integracao@labs.moip.com.br"
        passwordTextField.text = "testemoip"
        
        //controller.login(username: "integracao@labs.moip.com.br", password: "testemoip")
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let email = emailTextfield.text
        let password = passwordTextField.text
        
        SVProgressHUD.show()
        
        controller.login(email!, password: password!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.view.gestureRecognizers?.removeAll()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func finishLogin(_ access_token: String) {
        SVProgressHUD.dismiss(withDelay: 0.8)
        self.performSegue(withIdentifier: "segueOrdersTableViewController", sender: access_token)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController2 = segue.destination as? OrdersTableViewController {
            viewController2.access_token = sender as! String
        }
    }
    

}
