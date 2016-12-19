//
//  ViewController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import SVProgressHUD
import JDStatusBarNotification

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
        
        //emailTextfield.text = "integracao@labs.moip.com.br"
        //passwordTextField.text = "testemoip"
        
        //controller.login(username: "integracao@labs.moip.com.br", password: "testemoip")
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let email = emailTextfield.text
        let password = passwordTextField.text
        
        if isValidEmail(testStr: email!) {
            SVProgressHUD.show()
            controller.login(email!, password: password!)
        } else {
            JDStatusBarNotification.show(withStatus: "email inválido, digite novamente", dismissAfter: 3, styleName: JDStatusBarStyleWarning)
        }
        
        
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
        if access_token != "null" {
            self.performSegue(withIdentifier: "segueOrdersTableViewController", sender: access_token)
        } else {
            JDStatusBarNotification.show(withStatus: "usuário não encontrado", dismissAfter: 3, styleName: JDStatusBarStyleError)
        }
        
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController2 = segue.destination as? OrdersTableViewController {
            viewController2.access_token = sender as! String
        }
    }
    
    @IBAction func actionForgetMyPassword(_ sender: Any) {
        JDStatusBarNotification.show(withStatus: "botão esqueci minha senha está inativo", dismissAfter: 3, styleName: JDStatusBarStyleDark)
    }
    @IBAction func actionNewAccount(_ sender: Any) {
        JDStatusBarNotification.show(withStatus: "botão criar nova conta está inativo", dismissAfter: 3, styleName: JDStatusBarStyleDark)
    }

}
