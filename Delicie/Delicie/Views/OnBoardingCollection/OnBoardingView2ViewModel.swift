//
//  OnBoardingView2ViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 8.12.2023.
//

import UIKit

final class OnBoardingView2ViewModel:NSObject{
    
    private var cellViewModels: [OnBoarding2CollectionViewCellViewModel] = []
    
    let page1 = OnBoarding2CollectionViewCellViewModel(imageName: "slide1", firstText: "Quick Delivery At Your Doorstep", secondText: "Home delivery and Online rezervation system for restaurants and cafes")
    let page2 = OnBoarding2CollectionViewCellViewModel(imageName: "slide2", firstText: "World-Class Chefs", secondText: "Our dishes are prepared by the best")
    let page3 = OnBoarding2CollectionViewCellViewModel(imageName: "slide3", firstText: "Delicious Dishes", secondText: "Experince a variety of amazing dishes from different cultures around the world")
    
    override init() {
        self.cellViewModels.append(page1)
        self.cellViewModels.append(page2)
        self.cellViewModels.append(page3)
        
    }
    
    
}
extension OnBoardingView2ViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoarding2CollectionViewCell.cellIdentifier, for: indexPath) as? OnBoarding2CollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        
        let viewModel = cellViewModels[indexPath.row]
        
        cell.configure(with: viewModel)
        return cell
    }
}
// MARK: - Collectionview delegate

extension OnBoardingView2ViewModel:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = collectionView.bounds
        let width : CGFloat
        let height : CGFloat
        
        width = bounds.width
        height = bounds.height
        return CGSize(
            width: width,
            height: height)
        
    }
}
