//
//  HomeViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 22.12.2023.
//

import UIKit

protocol FoodCollectionViewViewModelDelegate: AnyObject{
    func didSelectCategory(_ dishCategory: DishCategory) //for going into detailed view
}

final class FoodCollectionViewViewModel: NSObject{
    
    public weak var delegate : FoodCollectionViewViewModelDelegate?
                
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photo/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photo/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photo/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photo/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photo/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 1006)
    ]
    }

extension FoodCollectionViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = collectionView.bounds
        let width, height: CGFloat
        
        width = (bounds.width-40)/2
        height = (bounds.height-20)/2
    
        return CGSize(
            width: width,
            height: height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dishCategory = categories[indexPath.row]
        delegate?.didSelectCategory(dishCategory)
    }
}
