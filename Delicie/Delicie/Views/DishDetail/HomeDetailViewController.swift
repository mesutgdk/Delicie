//
//  HomeDetailViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.01.2024.
//

import UIKit

final class HomeDetailViewController: UIViewController {
    
    private let homeDetailedView = HomeDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layout()
    }
    
    private func setup(){
        view.backgroundColor = .systemBackground
        
    }
    private func layout(){
        NSLayoutConstraint.activate([
            homeDetailedView.topAnchor.constraint(equalTo: view.topAnchor),
            homeDetailedView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeDetailedView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeDetailedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}
