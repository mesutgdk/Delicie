//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 22.12.2023.
//

import UIKit


final class FoodCollectionViewViewModel: NSObject{
            
    private lazy var categories : [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://source.unsplash.com/random/200x200?sig=1"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://source.unsplash.com/random/200x200?sig=2"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://source.unsplash.com/random/200x200?sig=3"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://source.unsplash.com/random/200x200?sig=2"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://source.unsplash.com/random/200x200?sig=1")
    ]
}

