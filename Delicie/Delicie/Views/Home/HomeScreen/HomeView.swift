//
//  HomeView.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func homeDetailedView(_ dishDetailedView: HomeView, didSelectDish dish: Dish)
    func homeToDishCategory(_ dishDetailedView: HomeView, didSelectCategory dishCategory: DishCategory)
}

final class HomeView: UIView {
    
    public weak var delegate: HomeViewDelegate?
    
    private let viewModel = HomeViewViewModel()
    
    private let foodViewModel = FoodCollectionViewViewModel()
    private let popularViewModel = PopularCollectionViewViewModel()
    private let chefViewModel = ChefCollectionViewViewModel()
    
    private let foodLabel1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Food Category"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        //        label.backgroundColor = .systemGray5
        
        return label
    }()
    
    private let popularLabel2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Dishes"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        //        label.backgroundColor = .systemGray5
        
        return label
    }()
    
    private let chefLabel3 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chef's Specials"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        //        label.backgroundColor = .systemGray5
        
        return label
    }()
    
    public let foodCollectionView1 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()
    public let popularCollectionView2 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        //        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = true
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()
    public let chefCollectionView3 : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        layout.sectionInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.clipsToBounds = false
        collectionView.register(ChefCollectionViewCell.self, forCellWithReuseIdentifier: ChefCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        
                foodCollectionView1.delegate = foodViewModel
                foodCollectionView1.dataSource = foodViewModel
        
                popularCollectionView2.delegate = popularViewModel
                popularCollectionView2.dataSource = popularViewModel
        
                chefCollectionView3.delegate = chefViewModel
                chefCollectionView3.dataSource = chefViewModel
        
        popularViewModel.delegate = self
        
        chefViewModel.delegate = self
        
        foodViewModel.delegate = self
        
    }
    
    private func layout(){
        //foodCategoryLabel
        NSLayoutConstraint.activate([
            foodLabel1.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            foodLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            foodLabel1.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
        // foodCollectionView
        NSLayoutConstraint.activate([
            foodCollectionView1.topAnchor.constraint(equalTo: foodLabel1.bottomAnchor, constant: 8),
            foodCollectionView1.leftAnchor.constraint(equalTo: leftAnchor),
            foodCollectionView1.rightAnchor.constraint(equalTo: rightAnchor),
            foodCollectionView1.heightAnchor.constraint(equalToConstant: 150)
        ])
        // chefCollectionView
        NSLayoutConstraint.activate([
            chefCollectionView3.topAnchor.constraint(equalTo: chefLabel3.bottomAnchor,constant: 8),
            chefCollectionView3.leftAnchor.constraint(equalTo: leftAnchor),
            chefCollectionView3.rightAnchor.constraint(equalTo: rightAnchor),
            chefCollectionView3.bottomAnchor.constraint(equalTo: bottomAnchor),
            chefCollectionView3.heightAnchor.constraint(equalToConstant: 100)
        ])
        //chefLabel
        NSLayoutConstraint.activate([
            chefLabel3.bottomAnchor.constraint(equalTo: chefCollectionView3.topAnchor, constant: -8),
            chefLabel3.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            chefLabel3.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
        //popularLabel
        NSLayoutConstraint.activate([
            popularLabel2.topAnchor.constraint(equalTo: foodCollectionView1.bottomAnchor, constant: 8),
            popularLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            popularLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
        // popularCollectionView
        NSLayoutConstraint.activate([
            popularCollectionView2.topAnchor.constraint(equalTo: popularLabel2.bottomAnchor, constant: 8),
            popularCollectionView2.leftAnchor.constraint(equalTo: leftAnchor),
            popularCollectionView2.rightAnchor.constraint(equalTo: rightAnchor),
            popularCollectionView2.bottomAnchor.constraint(equalTo: chefLabel3.topAnchor, constant: -8)
        ])
    }
    
}

// MARK: - FoodCollectionViewVMDelegate
extension HomeView: FoodCollectionViewViewModelDelegate{
    func didSelectCategory(_ dishCategory: DishCategory) {
        delegate?.homeToDishCategory(self, didSelectCategory: dishCategory)
    }
}

// MARK: - Popular/ChefCollectionViewVMDelegate
extension HomeView: PopularCollectionViewViewModelDelegate,ChefCollectionViewViewModelDelegate {
    
    func didSelectDish(_ dish: Dish) {
        delegate?.homeDetailedView(self, didSelectDish: dish)
    }
}
