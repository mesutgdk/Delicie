//
//  OnboardingViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let imageName: String
    private let titleText: String
    private let seconderyText: String

    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1).withSize(31)
//        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    private let secondLabel: UILabel = {
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
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor,constant: 150)
//            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //firstLabel
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            firstLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            firstLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            
        ])

        //secondLabel
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 16),
            secondLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            secondLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            
        ])

        
    }
}


