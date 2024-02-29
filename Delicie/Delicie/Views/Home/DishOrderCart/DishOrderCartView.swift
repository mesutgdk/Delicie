//
//  DishOrderCartView.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit

protocol DishOrderCartViewDelegate: AnyObject{
    func dishOrderCartView(_ dishOrderCartView: DishOrderCartView, didSelectOrder order: Order)
}

final class DishOrderCartView: UIView {
    
    public weak var delegate: DishOrderCartViewDelegate?
    
    private let viewModel = DishOrderCartViewVM()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DishOrderCartTableViewCell.self, forCellReuseIdentifier: DishOrderCartTableViewCell.cellIdentifier)
        tableView.rowHeight = DishOrderCartTableViewCell.rowHeight
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
        configureTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(tableView,spinner)
        spinner.startAnimating()
        
        animationSpinnerAndTableView()
        
        viewModel.delegate = self
        viewModel.fetchDishOrder()
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
    
    private func configureTableView(){
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    private func animationSpinnerAndTableView(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            self.spinner.stopAnimating()
            self.tableView.isHidden = false
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.3) {
                self.tableView.alpha = 1
            }
        }
    }
}
// MARK: - DishOrderCartTableViewVMDelegate
extension DishOrderCartView: DishOrderCartViewVMDelegate{
    func didSelectOrder(_ order: Order) {
        delegate?.dishOrderCartView(self, didSelectOrder: order)
    }
    
}

