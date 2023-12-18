//
//  OnBoarding1ViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 18.12.2023.
//

import UIKit

class OnBoarding1ViewController: UIViewController {
    
    var currentPg  = 0 {
        didSet{
            if currentPg == 2 {
                skipButton.setTitle("Get Started", for: .normal)
            } else {
                skipButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(OnBoarding2CollectionViewCell.self, forCellWithReuseIdentifier: OnBoarding2CollectionViewCell.cellIdentifier)

        return collectionView
    } ()
    
    let pageControl : UIPageControl = {
       let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.numberOfPages = 3
        pg.currentPage = 0
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
        
        layout()
        setup()

    }
    
    private func setup(){
        view.backgroundColor = .systemBackground
        
        view.addSubviews(collectionView,pageControl,skipButton)
        
        viewModel.delegate = self
        
    }
    private func layout(){
        //imageview
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200)
        ])
        //firstLabel
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
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

extension OnBoarding1ViewController{
    @objc private func nextTapped(){
        let nextIndex = min(pageControl.currentPage + 1, 2)
        let indexPath = IndexPath(item: nextIndex, section: 0)

    }
}
