//
//  HomeDetailViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.01.2024.
//

import UIKit

final class HomeDetailViewController: UIViewController {
    
    private let viewModel: HomeDetailViewViewModel
    
    private let homeDetailedView : HomeDetailView
    
    // MARK: - Init
//         to pass data with view model, it displays which cell we choose
    init(viewModel: HomeDetailViewViewModel ) {
        self.viewModel = viewModel
        self.homeDetailedView = HomeDetailView(frame: .zero, viewModel: viewModel)
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
        view.addSubview(homeDetailedView)
        
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
