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
    func finishOrders(_ list: [Order])
}

class OrderController: NSObject {
    var delegate: OrderProtocol?
    
    
    func order(_ access_token: String) {
        var arrayOrder: [Order] = []
        
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
         - price
         */
        Alamofire.request("https://sandbox.moip.com.br/v2/orders?limit=100", headers: headers).responseJSON { response in
            
            let json = JSON(data: response.data!)
            let orders = json["orders"]
            
            
            for o in orders {
                let order = Order(json: o.1)
                
                arrayOrder.append(order)
            }
            
            
            
            self.delegate?.finishOrders(arrayOrder)
        }
        
        
    }

    
}
