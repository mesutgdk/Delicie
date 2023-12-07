//
//  OnboardingViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let imageName: String
    let titleText: String
    let seconderyText: String

    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1).withSize(31)
//        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    let secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .systemGray
//        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    // MARK: - init
    init(imageName: String, titleText: String, secondTitleText: String) {
        self.imageName = imageName
        self.titleText = titleText
        self.seconderyText = secondTitleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController{
    
    private func setup(){
        view.backgroundColor = .systemBackground
        imageView.image = UIImage(named: imageName)
        
        firstLabel.text = titleText
        secondLabel.text = seconderyText
        
        view.addSubviews(imageView,firstLabel,secondLabel)
        
    }
    
    private func layout(){
        //imageview
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //firstLabel
        NSLayoutConstraint.activate([
            firstLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -50),
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        //secondLabel
        NSLayoutConstraint.activate([
            secondLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])

        
        
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
//        ])
        
    }
}


