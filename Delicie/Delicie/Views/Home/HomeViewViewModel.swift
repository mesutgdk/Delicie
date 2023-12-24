//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 22.12.2023.
//

import UIKit

final class HomeViewViewModel: NSObject{
        
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photo/180/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photo/180/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photo/180/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photo/180/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photo/180/200")
    ]
    
    
}
extension HomeViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.cellIdentifier , for: indexPath) as? FoodCollectionViewCell else {
            fatalError("hard error to deque Food Cell")
        }
        cell.configure(category: categories[indexPath.row])
        return cell
    }
}
