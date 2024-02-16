//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 2.02.2024.
//

import Foundation
import ProgressHUD

protocol HomeViewViewModelDelegate: AnyObject{
    func didFetchedData()
}

final class HomeViewViewModel: NSObject {
    
    public weak var delegate : HomeViewViewModelDelegate?
    
    lazy var categories : [DishCategory] = []
    
    lazy var populars: [Dish] = []
    
    lazy var specials: [Dish] = []
    
    func fetchData(){
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                //                print("it is successfull")
                ProgressHUD.dismiss()
                
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.delegate?.didFetchedData()
//                print(self?.specials)
                
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
    
}
