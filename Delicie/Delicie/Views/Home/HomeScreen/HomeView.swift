//
//  HomeView.swift
//  Delicie
//
//  Created by Mesut Gedik on 20.12.2023.
//

import UIKit
import ProgressHUD

protocol HomeViewDelegate: AnyObject {
    func homeDetailedView(_ dishDetailedView: HomeView, didSelectDish dish: Dish)
    func homeToDishCategory(_ dishDetailedView: HomeView, didSelectCategory dishCategory: DishCategory)
}

final class HomeView: UIView {
    
    public weak var delegate: HomeViewDelegate?
        
    var categories : [DishCategory] = [] 
    
    var populars: [Dish] = []
    
    var specials: [Dish] = []
    
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
        
                foodCollectionView1.delegate = self
                foodCollectionView1.dataSource = self
        
                popularCollectionView2.delegate = self
                popularCollectionView2.dataSource = self
        
                chefCollectionView3.delegate = self
                chefCollectionView3.dataSource = self
        
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
    
    func reloadCollectionViews(){
        foodCollectionView1.reloadData()
        popularCollectionView2.reloadData()
        chefCollectionView3.reloadData()
    }

}
// MARK: - CollectionView DataSource & Delegate
extension HomeView: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView {
        case foodCollectionView1:
            return categories.count
        case popularCollectionView2:
            return populars.count
        case chefCollectionView3:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCollectionView1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.cellIdentifier , for: indexPath) as? FoodCollectionViewCell else {
                fatalError("hard error to deque Food Cell")
            }
            cell.configure(category: categories[indexPath.row])
            return cell
        case popularCollectionView2:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier , for: indexPath) as? PopularCollectionViewCell else {
                fatalError("hard error to deque Food Cell")
            }
            cell.configure(dish: populars[indexPath.row])
            return cell
        case chefCollectionView3:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCollectionViewCell.cellIdentifier , for: indexPath) as? ChefCollectionViewCell else {
                fatalError("hard error to deque Food Cell")
            }
            cell.configureCell(dish: specials[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    // MARK: - CollectionView LayOut

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case foodCollectionView1:
            let bounds = collectionView.bounds
            let width, height: CGFloat
            
            width = (bounds.width-40)/2
            height = (bounds.height-20)/2
            
            return CGSize(
                width: width,
                height: height
            )
        case popularCollectionView2:
            
            let bounds = collectionView.bounds
            let width, height: CGFloat
            
            width = (bounds.width-20)/2
            height = (bounds.height-10)
            
            return CGSize(
                width: width,
                height: height
            )
  
        default:
            let bounds = collectionView.bounds
            let width, height: CGFloat
            
            width = (bounds.width-20)/2
            height = (bounds.height-10)
            
            return CGSize(
                width: width,
                height: height
            )
        }
      
    }
// MARK: - CollectionViewLayOut
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case foodCollectionView1:
            let dishCategory = categories[indexPath.row]
            delegate?.homeToDishCategory(self, didSelectCategory: dishCategory)
        case popularCollectionView2:
            let dish = populars[indexPath.row]
            delegate?.homeDetailedView(self, didSelectDish: dish)
        case chefCollectionView3:
            let dish = specials[indexPath.row]
            delegate?.homeDetailedView(self, didSelectDish: dish)
        default:
            return
        }
    }
}

extension HomeView{
    func fetchData(){

        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
//                print("it is successfull")
                ProgressHUD.dismiss()
//                print(allDishes.categories)

                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.foodCollectionView1.reloadData()
                self?.popularCollectionView2.reloadData()
                self?.chefCollectionView3.reloadData()

                
            case .failure(let error):
                print("The Error is \(error.localizedDescription)")
                ProgressHUD.error()
            }
        }
    }
}
