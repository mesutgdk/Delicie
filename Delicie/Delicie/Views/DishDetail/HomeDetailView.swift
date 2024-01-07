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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private let horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.attributedText = NSAttributedString(string: "sada asda adsad  awd a ")
        label.textColor = .systemGray
        
        return label
    }()
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your name"
        
        return textField
    }()
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Place Order", for: .normal)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.cornerRadius = 10
        
        return button
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
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(textField)
        verticalStackView.addArrangedSubview(button)
        
        addSubviews(detailedImageView,verticalStackView)
        
    }
    private func layout(){
        //detailedImageView
        NSLayoutConstraint.activate([
            detailedImageView.topAnchor.constraint(equalTo: topAnchor),
            detailedImageView.leftAnchor.constraint(equalTo: leftAnchor),
            detailedImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        // verticalStackView
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: detailedImageView.bottomAnchor, constant: 16),
            verticalStackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 16),
            verticalStackView.rightAnchor.constraint(equalTo: rightAnchor,constant: 16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
        //secondLabel
        NSLayoutConstraint.activate([
            secondLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        // textField
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 16)
        ])
        
        //button
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
    }

}
extension HomeDetailView{
    private func createNextButtonAction(){
        let action = UIAction{[weak self] _ in
            self?.nextTapped()
        }
        button.addAction(action, for: .primaryActionTriggered)

    }
    
    private func nextTapped(){
        
    }
}
