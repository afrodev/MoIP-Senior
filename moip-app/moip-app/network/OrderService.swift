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

protocol OrderProtocol: class {
    func finishOrders(_ list: [Order])
}



class OrderService {
     weak var delegate: OrderProtocol?
    
    
    func order(_ access_token: String) {
        var arrayOrder: [Order] = []
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "OAuth \(access_token)"
        ]
        
        Alamofire.request("https://sandbox.moip.com.br/v2/orders?limit=100", headers: headers).responseJSON { response in
            
            guard let data = response.data else {
                return
            }

            
            let json = JSON(data: data)
            let orders = json["orders"]
            
            for o in orders {
                let order = Order(json: o.1)
                
                arrayOrder.append(order)
            }
            
            self.delegate?.finishOrders(arrayOrder)
        }
        
        
    }

    
}
