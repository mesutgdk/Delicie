//
//  DishListTableViewView.swift
//  Delicie
//
//  Created by Mesut Gedik on 15.01.2024.
//

import UIKit

protocol DishListViewDelegate:AnyObject{
    func didSelectedDishDetailedView(_ dish: Dish)
}

final class DishListView: UIView {
    
    private let viewModel : DishListViewViewModel
    
    weak var delegate: DishListViewDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DishListTableViewCell.self, forCellReuseIdentifier: DishListTableViewCell.cellIdentifier)
        tableView.rowHeight = DishListTableViewCell.rowHeight
        tableView.separatorStyle = .none
        tableView.isHidden = true
        tableView.alpha = 0
        
        return tableView
    }()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    } ()
    // MARK: - Init
    
    init(frame: CGRect, viewModel: DishListViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(tableView,spinner)
        spinner.startAnimating()
                
        configureTableViewDelegates()

        viewModel.delegate = self
    }
    
    private func layout(){
        // spinner
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalTo: spinner.heightAnchor)
        ])
        // TableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTableViewDelegates(){
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    private func animationSpinnerAndTableView(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
            self.spinner.stopAnimating()
            self.tableView.isHidden = false
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.4) {
                self.tableView.alpha = 1
            }
        }
    }
}

// MARK: - DishListViewViewModelDelegate : To load data and tableview
extension DishListView: DishListViewViewModelDelegate{

    func didFetchDishCategory() {
        animationSpinnerAndTableView()
//        self.tableView.reloadData()
    }
    
    func didSelectDishDetailedView(_ dish: Dish) {
        
        delegate?.didSelectedDishDetailedView(dish)
    }
    
    
}
