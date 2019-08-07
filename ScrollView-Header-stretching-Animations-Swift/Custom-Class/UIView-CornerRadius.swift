//
//  UIView-CornerRadius.swift
//  AirPlayDemoiPhone
//
//  Created by Romin Dhameliya on 19/07/19.
//  Copyright © 2019 Romin Dhameliya. All rights reserved.
//

import UIKit

@IBDesignable class UIView_CornerRadius: UIView {
    
    
    @IBInspectable var customRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.customRadius
        }
    }
    
    @IBInspectable dynamic open var shadowColor: UIColor = .gray {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable dynamic open var shadowSize: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            self.layer.shadowOffset = shadowSize
        }
    }
    
    @IBInspectable dynamic open var shadowOpacity: Float = 1.0 {
        didSet {
             self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable dynamic open var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable dynamic open var maskBound: Bool = false {
        didSet {
            self.layer.masksToBounds = maskBound
        }
    }
    
    @IBInspectable dynamic open var isRoundWidth: Bool = false {
        didSet {
            if(isRoundWidth)
            {
                self.layer.cornerRadius = self.frame.width/2
            }
            else
            {
                self.layer.cornerRadius = customRadius
            }
        }
    }
    
    @IBInspectable dynamic open var isRoundHeight: Bool = false {
        didSet {
            if(isRoundHeight)
            {
                self.layer.cornerRadius = self.frame.height/2
            }
            else
            {
                self.layer.cornerRadius = customRadius
            }
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
    
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    
    
    
    
}
