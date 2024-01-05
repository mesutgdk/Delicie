//
//  ChefCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 28.12.2023.
//


import UIKit

final class ChefCollectionViewViewModel: NSObject{
                    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 1006),
        .init(id: "id1", name: "Garri", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 1006)
    ]
    }

extension ChefCollectionViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return dishes.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCollectionViewCell.cellIdentifier , for: indexPath) as? ChefCollectionViewCell else {
            fatalError("hard error to deque Food Cell")
        }
        cell.configureCell(dish: dishes[indexPath.row])
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
}
