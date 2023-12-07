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
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    let firstlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    let secondlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
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
        
        firstlabel.text = titleText
        secondlabel.text = seconderyText
        
        stackView.addArrangedSubview(imageView) // image is upper so it is up
        stackView.addArrangedSubview(firstlabel)
        
        view.addSubview(stackView)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
}


