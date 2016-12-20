//
//  OrderTableViewCell.swift
//  moip-app
//
//  Created by Humberto Vieira on 18/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelCreateDate: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var imageViewStatus: UIImageView!
    @IBOutlet weak var imageViewPaymentMethod: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(order: Order) {
        guard let updateAt = order.updatedAt else {
            return
        }
        
        guard let email = order.email else {
            return
        }
        
        guard let ownID = order.ownID else {
            return
        }
        
        guard let price = order.price else {
            return
        }
        
        guard let paymentMethod = order.paymentMethod else {
            return
        }
        guard let status = order.status else {
            return
        }
        
        self.labelCreateDate.text = formatDate(date: updateAt)
        self.labelEmail.text = email
        self.labelId.text = ownID
        self.labelPrice.text = "R$ \(price)"
        
        self.imageViewPaymentMethod.image = imagePayment(paymentMethod: paymentMethod)
        self.imageViewStatus.image = imageStatus(status: status)
    }

    
    func imagePayment(paymentMethod: PaymentMethod) -> UIImage {
        var _image: UIImage? = nil

        
        
        switch paymentMethod {
        case .bankBill:
            _image = UIImage(named: "boleto-icon")
        case .creditCard:
            _image = UIImage(named: "card-icon")
        case .onlineBankDebit:
            _image = UIImage(named: "online-bank-icon")
        case .debitCard:
            _image = UIImage(named: "debit-card-icon")
        }
        
        guard let image = _image else {
            return UIImage()
        }
        
        return image
        
        
    }
    
    
    func imageStatus(status: Status) -> UIImage {
        var _image: UIImage? = nil
        
        switch status {
        case .notPaid:
            _image = UIImage(named: "no-paid-icon")
        case .paid:
            _image = UIImage(named: "paid-icon")
        case .reverted:
            _image = UIImage(named: "revert-icon")
        case .waiting:
            _image = UIImage(named: "waiting-icon")
        }
        
        guard let image = _image else {
            return UIImage()
        }
        
        return image
    }
    
    
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter.string(from: date)
    }
}
