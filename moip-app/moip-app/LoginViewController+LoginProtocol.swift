//
//  LoginViewController+LoginProtocol.swift
//  moip-app
//
//  Created by Humberto Vieira on 12/20/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SVProgressHUD
import JDStatusBarNotification

extension LoginViewController : LoginProtocol {
    
    func finishLogin(_ access_token: String) {
        SVProgressHUD.dismiss(withDelay: 0.8)
        if access_token != "null" {
            self.performSegue(withIdentifier: "segueOrdersTableViewController", sender: access_token)
        } else {
            JDStatusBarNotification.show(withStatus: "usuário não encontrado", dismissAfter: 3, styleName: JDStatusBarStyleError)
        }
        
    }
    
}
