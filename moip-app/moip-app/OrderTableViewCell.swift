//
//  OrderTableViewCell.swift
//  moip-app
//
//  Created by Humberto Vieira on 18/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

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

}
