//
//  PopularCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 27.12.2023.
//

import UIKit


final class PopularCollectionViewViewModel: NSObject{
    
//    lazy var populars: [Dish] = []
    private lazy var populars: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006)
    ]
    
}

