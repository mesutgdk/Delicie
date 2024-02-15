//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 2.02.2024.
//

import Foundation
import ProgressHUD

protocol HomeViewViewModelDelegate: AnyObject{
    
}

final class HomeViewViewModel: NSObject {
    
    private lazy var categories : [DishCategory] = []
    
    private lazy var populars: [Dish] = []
    
    private lazy var specials: [Dish] = []
    
    func fetchData(){
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                //                print("it is successfull")
                ProgressHUD.dismiss()
                //                print(allDishes.categories)
                
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
    
}
