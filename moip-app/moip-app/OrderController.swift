//
//  OrderController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol OrderProtocol {
    func finishOrders(list: [Order])
}

class OrderController: NSObject {
    var delegate: OrderProtocol?
    
    
    func order(access_token: String) {
        print(access_token)
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "OAuth \(access_token)"
        ]
        
        /*
         
         what i need:
         - ownId
         - email
         - payment method (enum)
         - status (enum)
         - createdAt (date)
         
         */
        Alamofire.request("https://sandbox.moip.com.br/v2/orders?limit=1", headers: headers).responseJSON { response in
            print(response)
            self.delegate?.finishOrders(list: [])
        }
        
        
    }

    
}
