//
//  HomeDetailViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.01.2024.
//

import UIKit

final class DishDetailViewController: UIViewController {
    
    private let viewModel: DishDetailViewViewModel
    
    private let dishDetailedView : DishDetailView
    
    // MARK: - Init
//         to pass data with view model, it displays which cell we choose
    init(viewModel: DishDetailViewViewModel ) {
        self.viewModel = viewModel
        self.dishDetailedView = DishDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        layout()
    }
    // MARK: - Setup & Layout

    private func setup(){
        view.backgroundColor = .systemBackground
        view.addSubview(dishDetailedView)
        
    }
    private func layout(){
        NSLayoutConstraint.activate([
            dishDetailedView.topAnchor.constraint(equalTo: view.topAnchor),
            dishDetailedView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dishDetailedView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dishDetailedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}
