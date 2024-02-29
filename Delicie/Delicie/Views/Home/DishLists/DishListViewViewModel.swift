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
    func didSelectDishDetailedView(_ dish: Dish)
}

final class DishListViewViewModel:NSObject{
    
    var dishCategory: DishCategory? 
    
    weak var delegate: DishListViewViewModelDelegate?
    
    private var dishes: [Dish] = []
        
    // MARK: - init
    
    init(dishCategory : DishCategory){
        self.dishCategory = dishCategory
    }
    
    func fetchDishCategories(){
        
        NetworkService.shared.fetchCategoryDishes(categoryId: dishCategory?.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                DispatchQueue.main.async {
                    self?.delegate?.didFetchDishCategory()
                }
//                print(dishes)
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
}
extension DishListViewViewModel: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("tableView viewModelDishes counts: \(dishes.count)")
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.cellIdentifier, for: indexPath) as? DishListTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = dishes[indexPath.row]
        cell.configure(dish: viewModel)
//        cell.textLabel?.text = viewModel.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dish = dishes[indexPath.row]
        delegate?.didSelectDishDetailedView(dish)
    }
    
    
}
