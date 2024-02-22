//
//  DishTableViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 16.01.2024.
//

import UIKit
import ProgressHUD

protocol DishListViewViewModelDelegate:AnyObject{
    func didFetchDishCategory()
}
final class DishListViewViewModel:NSObject{
    
    var dishCategory: DishCategory!
    
    weak var delegate: DishListViewViewModelDelegate?
    
    private lazy var cellViewModels: [Dish] = []
    
    func fetchDischCategories(){
        NetworkService.shared.fetchCategoryDishs(categoryId: dishCategory?.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.cellViewModels = dishes
                self?.delegate?.didFetchDishCategory()
                print(dishes)
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
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
        cell.configure(dish: viewModel)
        
        return cell
    }
    
    
}
