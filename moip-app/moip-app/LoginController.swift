//
//  LoginController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//


import Alamofire

class LoginController: NSObject {
    
    class func login() {
        
        let parameters: Parameters = [
            "appId": "APP-YYOOK4LMHJS8",
            "appSecret": "iwnd4dmi4vni6azf6lzuxmhe0qtq8ut",
            "grantType": "password",
            "username": "integracao@labs.moip.com.br",
            "password": "testemoip"]
        
        
        Alamofire.request("https://sandbox.moip.com.br/oauth/accesstoken", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response)
            
            //print(response.result["access_token"])
        }
    }
    
    class func pedidos(access_token: String) {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization:": "OAuth \(access_token))"
        ]
        
        Alamofire.request("https://sandbox.moip.com.br/v2/orders?limit=100", headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
        
    }
    
    
    
}
