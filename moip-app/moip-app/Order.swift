//
//  Order.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SwiftyJSON

enum PaymentMethod {
    case bankBill
    case creditCard
}

enum Status {
    case notPaid
    case paid
    case reverted
    case waiting
}

class Order {
    var ownID: String?
    var email: String?
    var paymentMethod: PaymentMethod?
    var status: Status?
    var updatedAt: Date?
    
    
    init(json: JSON) {
        
        print(json)
        self.ownID = json["ownId"].string
        self.email = json["customer"]["email"].string
        
        let payments = json["payments"]["fundingInstrument"]["method"].string
        
        if payments == "BOLETO" {
            self.paymentMethod = .bankBill
        } else if payments == "CREDIT_CARD" {
            self.paymentMethod = .creditCard
        }
        
        let rStatus = json["status"].string
        
        if rStatus == "WAITING" {
            self.status = .waiting
        } else if  rStatus == "PAID" {
            self.status = .paid
        } else if rStatus == "REVERTED" {
            self.status = .reverted
        }else if rStatus == "NOT_PAID" {
            self.status = .notPaid
        }
        
        
        let strTime = json["updatedAt"].string
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        
        self.updatedAt = formatter.date(from: strTime!)
    }
    
}
