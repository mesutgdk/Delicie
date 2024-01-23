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
        
        title = "Orders"
        view.addSubview(dishOrderCartView)
        
        view.backgroundColor = .systemBackground
        dishOrderCartView.delegate = self
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
// MARK: - DishOrderCartViewDelegate
extension DishOrderCartViewController: DishOrderCartViewDelegate{
    func dishOrderCartView(_ dishOrderCartView: DishOrderCartView, didSelectOrder order: Order) {
        guard let orderDish = order.dish else {
            return
        }
        let viewModel = DishDetailViewViewModel(dish: orderDish)
        let detailedVC = DishDetailViewController(viewModel: viewModel)
        //        print(orderDish)
        
        detailedVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}

