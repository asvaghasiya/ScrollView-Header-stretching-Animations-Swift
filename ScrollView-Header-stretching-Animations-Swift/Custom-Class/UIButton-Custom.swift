//
//  UIButton-Custom.swift
//  Sportily
//
//  Created by Artoon Solutions Private Limited on 26/07/19.
//  Copyright © 2019 Artoon Solutions Private Limited. All rights reserved.
//

import UIKit

@IBDesignable class UIButton_Custom: UIButton {

    
    @IBInspectable var customRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.customRadius
        }
    }
    
    @IBInspectable dynamic open var maskBound: Bool = false {
        didSet {
            self.layer.masksToBounds = maskBound
        }
    }
    
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable dynamic open var backdroungColor: UIColor = .gray {
        didSet {
            self.layer.backgroundColor = backdroungColor.cgColor
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    

}
