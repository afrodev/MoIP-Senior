//
//  OrderTableViewController+OrderProtocol.swift
//  moip-app
//
//  Created by Humberto Vieira on 12/20/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation


extension OrdersTableViewController : OrderProtocol {
    
    func finishOrders(_ list: [Order]) {
        orderArray = list
        
        self.tableView.reloadData()
    }

}
