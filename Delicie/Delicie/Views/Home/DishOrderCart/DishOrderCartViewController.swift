//
//  DishOrderCartViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit

final class DishOrderCartViewController: UIViewController {

    private let dishOrderCartView = DishOrderCartView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    private func setup() {
        view.addSubview(dishOrderCartView)

        view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        // characterListView
        NSLayoutConstraint.activate([
            dishOrderCartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dishOrderCartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dishOrderCartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dishOrderCartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
