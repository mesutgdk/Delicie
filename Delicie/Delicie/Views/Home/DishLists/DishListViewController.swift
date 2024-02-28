//
//  DishListViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 16.01.2024.
//

import UIKit

final class DishListViewController: UIViewController {
    
    private let dishLishView : DishListView
    
    private let viewModel : DishListViewViewModel
    
    // MARK: - Init
    //  to pass data with view model, it displays which cell we choose
    init(viewModel: DishListViewViewModel ) {
        self.viewModel = viewModel
        self.dishLishView = DishListView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    private func setup() {
        view.addSubview(dishLishView)
        
        view.backgroundColor = .systemBackground
        
        dishLishView.delegate = self
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

// MARK: - DishlistViewDelegate : To push selected cell from dishListTableView
extension DishListViewController: DishListViewDelegate{
    func didSelectedDishDetailedView(_ dish: Dish) {
        let viewModel = DishDetailViewViewModel(dish: dish)
        let detailedVC = DishDetailViewController(viewModel: viewModel)
        //        print(dish)
        detailedVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}
