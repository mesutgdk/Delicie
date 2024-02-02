//
//  PopularCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 27.12.2023.
//

import UIKit

protocol PopularCollectionViewViewModelDelegate: AnyObject{
    func didSelectDish(_ dish: Dish) //for going into detailed view
}

final class PopularCollectionViewViewModel: NSObject{
    
    public weak var delegate: PopularCollectionViewViewModelDelegate?
    
    lazy var populars: [Dish] = []
//    private lazy var populars: [Dish] = [
//        .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34),
//        .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214),
//        .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006)
//    ]
}

// MARK: -PopularCollectionViewDelegate
extension PopularCollectionViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return populars.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier , for: indexPath) as? PopularCollectionViewCell else {
            fatalError("hard error to deque Food Cell")
        }
        cell.configure(dish: populars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = collectionView.bounds
        let width, height: CGFloat
        
        width = (bounds.width-20)/2
        height = (bounds.height-10)
        
        return CGSize(
            width: width,
            height: height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dish = populars[indexPath.row]
        delegate?.didSelectDish(dish)
    }
}
