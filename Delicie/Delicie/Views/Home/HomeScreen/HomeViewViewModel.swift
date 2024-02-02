//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 2.02.2024.
//

import Foundation
import ProgressHUD

final class HomeViewViewModel {
    
    
    func fetchData(){
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
//                print("it is successfull")
                ProgressHUD.dismiss()
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
}
