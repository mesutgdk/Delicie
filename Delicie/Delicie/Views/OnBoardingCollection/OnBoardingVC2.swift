//
//  OnBoardingVC2.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

final class OnBoardingVC2: UIViewController {

    private let onBoardingView = OnBoardingView2()
    
    private let viewModel = OnBoardingView2ViewModel()
    
    static var currentPg : Int = 0
    
    let pageControl : UIPageControl = {
       let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.numberOfPages = 3
        pg.currentPage = OnBoardingVC2.currentPg
        pg.currentPageIndicatorTintColor = .systemRed
        pg.pageIndicatorTintColor = .systemGray3
//        pg.backgroundColor = .red
        return pg
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemGray5
        button.tintColor = .black
        button.cornerRadius = 10
        
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
    }
    
    private func setup(){
        view.backgroundColor = .systemBackground
        
        view.addSubviews(onBoardingView,pageControl,skipButton)
        
        viewModel.delegate = self
    }
    
    private func layout(){
        //imageview
        NSLayoutConstraint.activate([
            onBoardingView.topAnchor.constraint(equalTo: view.topAnchor),
            onBoardingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            onBoardingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            onBoardingView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200)
        ])
        //firstLabel
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: onBoardingView.bottomAnchor, constant: 16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            pageControl.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
//            pageControl.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            
        ])

        //secondLabel
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skipButton.widthAnchor.constraint(equalToConstant: 150),
            skipButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])

        
    }
}
extension OnBoardingVC2{
    
    @objc private func nextTapped(){
        pageControl.currentPage = OnBoardingVC2.currentPg
        let nextIndex = min(pageControl.currentPage + 1, 2)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        onBoardingView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

    }
    
}

extension OnBoardingVC2:OnboardingViewModelDelegate{
    func setCurrentPage(_ onBoardingView2ViewModel: OnBoardingView2ViewModel, didSetCurrentPage cPage: Int) {
        print("delegate page : \(cPage)")
        pageControl.currentPage = cPage
       
    }
    
    
}

