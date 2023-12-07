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
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIDevice{
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
