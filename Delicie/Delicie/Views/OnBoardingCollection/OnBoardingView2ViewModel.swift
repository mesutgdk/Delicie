//
//  OnBoardingView2ViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 8.12.2023.
//

import UIKit

final class OnBoardingView2ViewModel{
    
    let page1 = OnBoarding2CollectionViewCellViewModel(imageName: "slide1", firstText: "Quick Delivery At Your Doorstep", secondText: "Home delivery and Online rezervation system for restaurants and cafes")
    let page2 = OnBoarding2CollectionViewCellViewModel(imageName: "slide2", firstText: "World-Class Chefs", secondText: "Our dishes are prepared by the best")
    let page3 = OnBoarding2CollectionViewCellViewModel(imageName: "slide3", firstText: "Delicious Dishes", secondText: "Experince a variety of amazing dishes from different cultures around the world")
    
    let cellViewModels: [OnBoarding2CollectionViewCellViewModel] = [page1,page2,page3]
}
