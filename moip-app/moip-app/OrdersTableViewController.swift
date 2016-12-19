//
//  OrdersTableViewController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController,  OrderProtocol {

    var access_token: String = ""
    let controller = OrderController()
    var orderArray: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Access Token: \(access_token)")
        
        self.navigationController?.navigationBar.topItem?.title = "Vendas"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 0, green: 153/255.0, blue: 224/255.0, alpha: 1.0)
        
        let a = UINib(nibName: "OrderCell", bundle: nil)
        self.tableView.register(a, forCellReuseIdentifier: "cellOrderNew")
        
        controller.delegate = self
        controller.order(access_token)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return orderArray.count
    }
    
    func finishOrders(_ list: [Order]) {
        orderArray = list
        
        self.tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOrderNew", for: indexPath) as! OrderTableViewCell
        
        let order = orderArray[indexPath.row]
        
        cell.labelCreateDate.text = formatDate(date: order.updatedAt!)
        cell.labelEmail.text = order.email
        cell.labelId.text = order.ownID
        cell.labelPrice.text = "R$ \(order.price!)"
        
        
        cell.imageViewPaymentMethod.image = imagePayment(paymentMethod: order.paymentMethod!)
        
        //cell.imageViewPaymentMethod
        //cell.imageViewStatus
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    func imagePayment(paymentMethod: PaymentMethod) -> UIImage {
        switch paymentMethod {
        case .bankBill:
            return UIImage(named: "boleto-icon")!
        case .creditCard:
            return UIImage(named: "card-icon")!
        case .onlineBankDebit:
            return UIImage(named: "Bank-50")!
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter.string(from: date)
        
    }
    
}
