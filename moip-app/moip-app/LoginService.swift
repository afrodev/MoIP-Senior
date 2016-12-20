//
//  LoginController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol LoginProtocol {
    func finishLogin(_ access_token: String)
}

class LoginService: NSObject {
    var delegateLogin: LoginProtocol?
    var delegateOrder: OrderProtocol?
    
    func login(_ username: String, password: String) {
        
        let parameters: Parameters = [
            "appId": "APP-YYOOK4LMHJS8",
            "appSecret": "iwnd4dmi4vni6azf6lzuxmhe0qtq8ut",
            "grantType": "password",
            "username": "\(username)", //integracao@labs.moip.com.br
            "password": "\(password)"] // testemoip
        
        
        Alamofire.request("https://sandbox.moip.com.br/oauth/accesstoken", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            
            guard let data = response.data else {
                return
            }
            
            let json = JSON(data: data)
            let access_token = json["access_token"]
                
            self.delegateLogin?.finishLogin("\(access_token)")
            
        }
    }
    
        
    
    
}
