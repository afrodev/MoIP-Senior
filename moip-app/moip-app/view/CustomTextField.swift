//
//  CustomTextField.swift
//  moip-app
//
//  Created by Humberto Vieira on 11/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    let inset: CGFloat = 50
    var leftImage: UIImage?
    let padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0);

    
    override func draw(_ rect: CGRect) {
        self.leftViewMode = .always
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.image = leftImage
        self.leftView = imageView
        
        setBottomBorder(.white)
        
        if let _placeholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: _placeholder, attributes: [NSForegroundColorAttributeName : UIColor.white])
        }
    }
    
    
    func setBottomBorder(_ borderColor: UIColor)
    {
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let width = 0.3
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    
    
    
    
    
    
}















