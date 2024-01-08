//
//  ChefCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 28.12.2023.
//


import UIKit

protocol ChefCollectionViewViewModelDelegate: AnyObject{
    func didSelectDish(_ dish: Dish) //for going into detailed view
}

final class ChefCollectionViewViewModel: NSObject{
    
    public weak var delegate: ChefCollectionViewViewModelDelegate?
                    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", image: "https://picsum.photo/100/200", description: "This is my favorite dish.", calories: 34),
        .init(id: "id1", name: "Beans and Garri", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 1006),
        .init(id: "id1", name: "Garri", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photo/100/200", description: "This is the best I ever had", calories: 1006)
    ]
    }

extension ChefCollectionViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return specials.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCollectionViewCell.cellIdentifier , for: indexPath) as? ChefCollectionViewCell else {
            fatalError("hard error to deque Food Cell")
        }
        cell.configureCell(dish: specials[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = collectionView.bounds
        let width, height: CGFloat
        
        width = (bounds.width-40)/2
        height = (bounds.height-20)
    
        return CGSize(
            width: width,
            height: height
        )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dish = specials[indexPath.row]
        delegate?.didSelectDish(dish)
    }
}
