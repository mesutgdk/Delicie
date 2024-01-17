//
//  HomeViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    private func setup(){
        title = "Delicie"
        view.backgroundColor = .systemGray6
        homeView.backgroundColor = .systemGray6
        
        addNavigationItem()
        view.addSubview(homeView)
        
        homeView.delegate = self
        
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
extension HomeViewController: HomeViewDelegate{

    
    func homeDetailedView(_ dishDetailedView: HomeView, didSelectDish dish: Dish) {
        let viewModel = HomeDetailViewViewModel(dish: dish)
        let detailedVC = HomeDetailViewController(viewModel: viewModel)
//        print(dish)
        
        detailedVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailedVC, animated: true)  // homeVC is a rootVC with navC, so navC will push
        
    }
    
    func homeToDishCategory(_ dishDetailedView: HomeView, didSelectCategory dishCategory: DishCategory) {
        let viewModel = DishListViewViewModel()
        viewModel.dishCategory = dishCategory
        let vc = DishListViewController()
        vc.title = viewModel.dishCategory?.name
        vc.navigationItem.largeTitleDisplayMode = .automatic
        
        navigationController?.pushViewController(vc, animated: true)  // homeVC is a rootVC with navC, so navC will push
    }
    
}
