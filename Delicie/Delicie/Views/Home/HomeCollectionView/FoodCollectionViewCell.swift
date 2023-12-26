//
//  FoodCollectionViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 21.12.2023.
//

import UIKit
import Kingfisher

final class FoodCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = String(describing: FoodCollectionViewCell.self)
    
    private let cardView = CardView()
    
    let foodImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let foodLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Food"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    // MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        contentView.backgroundColor = .systemBackground
        contentView.layer.masksToBounds = true
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = false
        
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.black.cgColor
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 4

        contentView.addSubviews(foodImageView,foodLabel)
    }
    private func layout(){
        
        // foodImageView
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            foodImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        //foodLAbel
        NSLayoutConstraint.activate([
            foodLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            foodLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 8),
            foodLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    override func prepareForReuse() {  // hücreleri tekrar kullanabilmek için nille
        super.prepareForReuse()
        foodLabel.text = nil
        foodImageView.image = nil
    }
    
    func configure(category: DishCategory){
        foodLabel.text = category.name
        foodImageView.kf.setImage(with: category.image.asUrl)
    }
}
