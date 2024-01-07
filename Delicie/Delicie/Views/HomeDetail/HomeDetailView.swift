//
//  HomeDetailView.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.01.2024.
//

import UIKit

final class HomeDetailView: UIView {
    
    let detailedImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let verticalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .systemRed
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(){
        horizontalStackView.addArrangedSubview(firstLabel)
        horizontalStackView.addArrangedSubview(secondLabel)
        
        
    }
    private func layout(){
        NSLayoutConstraint.activate([
            secondLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
