//
//  OnBoardingView2ViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 8.12.2023.
//

import UIKit

protocol OnboardingViewModelDelegate: AnyObject{
    func setCurrentPage(_ onBoardingView2ViewModel: OnBoardingView2ViewModel, didSetCurrentPage cPage: Int)
}

final class OnBoardingView2ViewModel:NSObject{
    
    weak var delegate : OnboardingViewModelDelegate?
    
    private var cellViewModels: [OnBoarding2CollectionViewCellViewModel] = []
    
    lazy var currentPage = 0
    
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
       
        return CGSize(
            width: bounds.width,
            height: bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        
        currentPage = Int(scrollView.contentOffset.x / width)
        print("Current page: \(currentPage) ")
        
        let nextIndex = min(currentPage + 1, 2)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        
        OnBoardingVC2.currentPg = currentPage
        
        delegate?.setCurrentPage(self, didSetCurrentPage: currentPage)
    }
}


