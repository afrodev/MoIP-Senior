//
//  OrdersTableViewController.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {

    var access_token: String = ""
    let service = OrderService()
    var orderArray: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.contentInset.top = 20
        print("Access Token: \(access_token)")
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 0, green: 153/255.0, blue: 224/255.0, alpha: 1.0)
        
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let a = UINib(nibName: "OrderCell", bundle: nil)
        self.tableView.register(a, forCellReuseIdentifier: "cellOrderNew")
        
        service.delegate = self
        service.order(access_token)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = orderArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOrderNew", for: indexPath) as! OrderCell
        
        cell.configure(order: order)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    @IBAction func actionExit(_ sender: Any) {
        self.performSegue(withIdentifier: "segueLoginViewController", sender: self)
    }


    
}
