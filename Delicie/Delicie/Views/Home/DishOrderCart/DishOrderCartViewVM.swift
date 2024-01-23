//
//  DishOrderCartViewVM.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import UIKit

final class DishOrderCartViewVM:NSObject{
    
    lazy var orders: [Order] = [
    
    ]
}
extension DishOrderCartViewVM: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.cellIdentifier, for: indexPath) as? DishListTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(viewModel: viewModel)
        
        return cell
    }
    
    
}
