//
//  HomeView.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit

final class HomeView: UIView {

    private let foodLabel1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Food Category"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let popularLabel2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Dishes"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let chefLabel3 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chef's Specials"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let foodCollectionView1 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray5
        
        return collectionView
    }()
    private let popularCollectionView2 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray5

        
        return collectionView
    }()
    private let chefCollectionView3 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray5

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
        
        setupCollectionViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubviews(
            foodLabel1,
            foodCollectionView1,
            popularLabel2,
            popularCollectionView2,
            chefLabel3,
            chefCollectionView3
        )
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func layout(){
        //foodCategoryLabel
        NSLayoutConstraint.activate([
            foodLabel1.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            foodLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            foodLabel1.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ])
        // foodCategoryCollectionView
        NSLayoutConstraint.activate([
            foodCollectionView1.topAnchor.constraint(equalTo: foodLabel1.bottomAnchor),
            foodCollectionView1.leftAnchor.constraint(equalTo: leftAnchor),
            foodCollectionView1.rightAnchor.constraint(equalTo: rightAnchor),
            foodCollectionView1.heightAnchor.constraint(equalToConstant: 150)
        ])
        // chefCollectionView
        NSLayoutConstraint.activate([
            chefCollectionView3.topAnchor.constraint(equalTo: chefLabel3.bottomAnchor),
            chefCollectionView3.leftAnchor.constraint(equalTo: leftAnchor),
            chefCollectionView3.rightAnchor.constraint(equalTo: rightAnchor),
            chefCollectionView3.bottomAnchor.constraint(equalTo: bottomAnchor),
            chefCollectionView3.heightAnchor.constraint(equalToConstant: 150)
        ])
        //chefLabel
        NSLayoutConstraint.activate([
            chefLabel3.bottomAnchor.constraint(equalTo: chefCollectionView3.topAnchor, constant: -4),
            chefLabel3.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            chefLabel3.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ])
        //popularLabel
        NSLayoutConstraint.activate([
            popularLabel2.topAnchor.constraint(equalTo: foodCollectionView1.bottomAnchor, constant: 4),
            popularLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            popularLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ])
        // popularCollectionView
        NSLayoutConstraint.activate([
            popularCollectionView2.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor),
            popularCollectionView2.leftAnchor.constraint(equalTo: leftAnchor),
            popularCollectionView2.rightAnchor.constraint(equalTo: rightAnchor),
            popularCollectionView2.bottomAnchor.constraint(equalTo: chefLabel3.topAnchor)
        ])
    }
    private func setupCollectionViews(){
//        collectionView.dataSource = collectionViewModel
//        collectionView.delegate = collectionViewModel
        
    }

}