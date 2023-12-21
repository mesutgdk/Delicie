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
        label.text = "Food Category"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let popularLabel2 : UILabel = {
        let label = UILabel()
        label.text = "Popular Dishes"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let chefLabel3 : UILabel = {
        let label = UILabel()
        label.text = "Chef's Specials"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    private let foodCollectionView1 : UICollectionView = {
       let collectionView = UICollectionView()
        
        return collectionView
    }()
    private let popularCollectionView2 : UICollectionView = {
       let collectionView = UICollectionView()
        
        return collectionView
    }()
    private let chefCollectionView3 : UICollectionView = {
       let collectionView = UICollectionView()
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
                
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
            foodLabel1.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            foodLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            foodLabel1.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        ])
        // foodCategoryCollectionView
        NSLayoutConstraint.activate([
            foodCollectionView1.topAnchor.constraint(equalTo: foodLabel1.bottomAnchor, constant: 4),
            foodCollectionView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            foodCollectionView1.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            foodCollectionView1.heightAnchor.constraint(equalToConstant: frame.height/5)
        ])
        // chefCollectionView
        NSLayoutConstraint.activate([
            chefCollectionView3.topAnchor.constraint(equalTo: chefLabel3.bottomAnchor, constant: 4),
            chefCollectionView3.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            chefCollectionView3.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            chefCollectionView3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            chefCollectionView3.heightAnchor.constraint(equalToConstant: frame.height/5)
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
            popularCollectionView2.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor, constant: 4),
            popularCollectionView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            popularCollectionView2.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
            popularCollectionView2.bottomAnchor.constraint(equalTo: chefLabel3.topAnchor, constant: -4)
        ])
    }
    

}
