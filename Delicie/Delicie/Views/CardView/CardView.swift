//
//  CardView.swift
//  Delicie
//
//  Created by Mesut Gedik on 26.12.2023.
//

import UIKit

final class CardView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.opacity = 0.1
        cornerRadius = 10
    }
}
