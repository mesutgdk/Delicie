//
//  OnBoardingView2.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

final class OnBoardingView2: UIView{
    
    private let viewModel = OnBoardingView2ViewModel()

    private let collectionView: UICollectionView = {
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
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(collectionView)

        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
    
    private func layout(){
        // collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }
    
}

