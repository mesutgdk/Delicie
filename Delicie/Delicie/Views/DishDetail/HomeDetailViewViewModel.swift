//
//  HomeDetailViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 9.01.2024.
//

import UIKit
import Kingfisher

final class HomeDetailViewViewModel{
    
    let dish : Dish
    
    let imageView = UIImageView()
    
    // MARK: - init

    init(dish : Dish){
        self.dish = dish
        fetchImage()
    }
    
    func fetchImage(){
        imageView.image = UIImage(systemName: "trash")
//        imageView.kf.setImage(with: dish.image?.asUrl)
    }
    
}
