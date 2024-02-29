//
//  DishOrderCartViewVM.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit
import ProgressHUD

protocol DishOrderCartViewVMDelegate: AnyObject{
    func didSelectOrder(_ order: Order) //for going into detailed view
    func didFetchOrder() // to fetch orders
}

final class DishOrderCartViewVM:NSObject{
    
    public weak var delegate : DishOrderCartViewVMDelegate?
    
    private var orders: [Order] = [] {
        didSet {
            for order in orders {
                let viewModel = DishOrderCartTableViewCellVM(order: order)
                
                orderCellViewModels.append(viewModel)
            }
        }
    }
    
    private lazy var orderCellViewModels: [DishOrderCartTableViewCellVM] = []
    
    func fetchDishOrder(){
        NetworkService.shared.fetchOrders { [weak self] (result)in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.delegate?.didFetchOrder()
                print(orders)
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
}
extension DishOrderCartViewVM: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishOrderCartTableViewCell.cellIdentifier, for: indexPath) as? DishOrderCartTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = orderCellViewModels[indexPath.row]
        cell.configure(viewModel: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = orderCellViewModels[indexPath.row]
        delegate?.didSelectOrder(selectedCell.order)
        
//        delegate?.didFetchOrder() // to refresh orders
    }
}
