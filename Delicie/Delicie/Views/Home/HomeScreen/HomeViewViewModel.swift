//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 2.02.2024.
//

import Foundation
import ProgressHUD

final class HomeViewViewModel: NSObject {
    
    func fetchData(){

        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
//                print("it is successfull")
                ProgressHUD.dismiss()
//                print(allDishes.categories)
                
                let foodViewModel = FoodCollectionViewViewModel()
                let popularViewModel = PopularCollectionViewViewModel()
                let chefViewModel = ChefCollectionViewViewModel()
                
                let foods = allDishes.categories
                let populars = allDishes.dishes
                let chefs = allDishes.specials
                
                guard let foods = foods else {
                    print( "somethimg went woring, nillness1 happended")
                    return 
                }
                guard let populars = populars else {
                    print( "somethimg went woring, nillness2 happended")
                    
                }
                guard let chefs = chefs else {
                    print( "somethimg went woring, nillness3 happended")
                    
                }
                print("food2 is : \(foods)")
                print("popular is : \(populars)")
                print("cheff is : \(chefs)")
                
                foodViewModel.categories = foods
                popularViewModel.populars = allDishes.dishes ?? []
                chefViewModel.specials = allDishes.specials ?? []
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
}

