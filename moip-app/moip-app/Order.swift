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
    case credicCard
}

enum Status {
    case noPaid
    case paid
    case reverted
    case waiting
}

class Order {
    var ownID: String?
    var email: String?
    var paymentMethod: PaymentMethod?
    var status: Status?
    var createdAt: Date?
    
    
    init(json: JSON) {
        
    }
    
}
