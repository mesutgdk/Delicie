//
//  DishListViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 16.01.2024.
//

import UIKit

final class DishListViewController: UIViewController {

    private let dishLishView = DishListView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    private func setup() {
        view.addSubview(dishLishView)

        view.backgroundColor = .systemBackground        
    }
    
    private func layout() {
        // characterListView
        NSLayoutConstraint.activate([
            dishLishView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dishLishView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dishLishView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dishLishView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
