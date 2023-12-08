//
//  OnBoardingVC2.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

final class OnBoardingVC2: UIViewController {

    private let onBoardingView = OnBoardingView2()
    
    private let pageControl : UIPageControl = {
       let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.numberOfPages = 3
        pg.currentPage = 1
        return pg
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: [])
        button.backgroundColor = .systemGray5
        button.tintColor = .black
        button.cornerRadius = 10
        
        button.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
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
    
    @objc func nextTapped(){
       
        print("end of the road")
    }
}
