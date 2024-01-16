//
//  DishTableViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 16.01.2024.
//

import UIKit

final class DishTableViewViewModel:NSObject{
    
    var dishes : [Dish] = []
    
}
extension DishTableViewViewModel: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.cellIdentifier, for: indexPath) as? DishListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel: <#T##DishTableViewCellViewModel#>)
        
        return cell
    }
    
    
}
