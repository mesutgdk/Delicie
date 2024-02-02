//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 2.02.2024.
//

import Foundation
import ProgressHUD

final class HomeViewViewModel: NSObject {
    
    private let foodViewModel = FoodCollectionViewViewModel()
    private let popularViewModel = PopularCollectionViewViewModel()
    private let chefViewModel = ChefCollectionViewViewModel()
    
    func fetchData(){

        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
//                print("it is successfull")
                ProgressHUD.dismiss()
                self?.foodViewModel.categories = allDishes.categories ?? []
                self?.popularViewModel.populars = allDishes.dishes ?? []
                self?.chefViewModel.specials = allDishes.specials ?? []
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
}

