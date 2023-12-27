//
//  HomeViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private let foodViewModel = FoodCollectionViewViewModel()
    private let popularViewModel = PopularCollectionViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    private func setup(){
        title = "Delicie"
        view.backgroundColor = .systemBackground
        addNavigationItem()
        view.addSubview(homeView)
        homeView.backgroundColor = .red
        
        homeView.foodCollectionView1.delegate = foodViewModel
        homeView.foodCollectionView1.dataSource = foodViewModel
        
        homeView.popularCollectionView2.delegate = popularViewModel
        homeView.popularCollectionView2.dataSource = popularViewModel
        
    }
    
    private func layout(){
        //homeView
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
