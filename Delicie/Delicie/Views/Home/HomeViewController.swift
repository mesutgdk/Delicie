//
//  HomeViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    private func setup(){
        title = "Delicie"
        view.backgroundColor = .systemBackground
        
        addNavigationItem()
    }
    
    private func layout(){
        
    }
    
    private func addNavigationItem(){
        let cardItem = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .plain, target: self, action: #selector(cardButtonTapped))
        cardItem.tintColor = .systemRed
        navigationItem.rightBarButtonItem = cardItem
    }
    
    // MARK: - Action Functions
    @objc private func cardButtonTapped(){
        
    }
    
}
