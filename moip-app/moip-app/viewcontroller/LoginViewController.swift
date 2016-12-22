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

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    let service = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Dimiss Keyboard touching anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        service.delegate = self

        emailTextfield.leftImage = UIImage(named: "email-icon")
        passwordTextField.leftImage = UIImage(named: "password-icon")
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        guard let email = emailTextfield.text, isValidEmail(testStr: email) else {
            JDStatusBarNotification.show(withStatus: "email não digitado corretamente, digite novamente", dismissAfter: 3, styleName: JDStatusBarStyleWarning)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty  else {
            JDStatusBarNotification.show(withStatus: "senha não digitada corretamente, digite novamente", dismissAfter: 3, styleName: JDStatusBarStyleWarning)
            return
        }
        
        SVProgressHUD.show()
        service.login(email, password: password)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.view.gestureRecognizers?.removeAll()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // Verifica se o email é válido
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
        JDStatusBarNotification.show(withStatus: "botão \"esqueci minha senha\" está inativo", dismissAfter: 3, styleName: JDStatusBarStyleDark)
    }
    @IBAction func actionNewAccount(_ sender: Any) {
        JDStatusBarNotification.show(withStatus: "botão \"criar nova conta\" está inativo", dismissAfter: 3, styleName: JDStatusBarStyleDark)
    }

}
