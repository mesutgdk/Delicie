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
        view.backgroundColor = .systemBackground

        title = "Delicie"
        addNavigationItem()
    }
    
    private func addNavigationItem(){
        let cardItem = UIBarButtonItem(image: UIImage(systemName: "card.circle.fill"), style: .plain, target: self, action: #selector(cardButtonTapped))
        navigationItem.rightBarButtonItem = cardItem
    }
    
    @objc private func cardButtonTapped(){
        
    }
    
}
