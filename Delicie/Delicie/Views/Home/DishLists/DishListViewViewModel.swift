//
//  DishTableViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 16.01.2024.
//

import UIKit

final class DishListViewViewModel:NSObject{
    
    lazy var dishCategory: DishCategory? = nil
    
    private var cellViewModels: [DishTableViewCellViewModel] = [
        .init(dish: .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34)),
        .init(dish: .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214)),
        .init(dish: .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006))
        
    ]
    
}
extension DishListViewViewModel: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellViewModels.count
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
