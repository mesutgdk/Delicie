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
    
    func addShadow(_ view: UIView){
        view.layer.masksToBounds = true
        
        view.layer.cornerRadius = 8
        view.clipsToBounds = false
        
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.black.cgColor
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4
    }
}

extension UIDevice{
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
