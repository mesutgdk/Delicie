//
//  UIView+Extension.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

extension UIView{
    var cornerRadius : CGFloat{
        get{
            return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
