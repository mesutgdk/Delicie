//
//  ChefCollectionViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 21.12.2023.
//

import UIKit
import Kingfisher

final class ChefCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = String(describing: ChefCollectionViewCell.self)
    
    let dishImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .systemPink
        imageView.cornerRadius = 10
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let dishTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    let dishDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    let dishCaloryLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.adjustsFontForContentSizeCategory = true
//        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(){
        stackView.addArrangedSubview(dishTitleLabel)
        stackView.addArrangedSubview(dishDescriptionLabel)
        stackView.addArrangedSubview(dishCaloryLabel)
        
        contentView.addSubviews(dishImageView,stackView)
        contentView.addShadow(self)
    }
    
    private func layout(){
        //chefImageView
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leftAnchor.constraint(equalTo: dishImageView.rightAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    
    override func prepareForReuse() {  // hücreleri tekrar kullanabilmek için nille
        super.prepareForReuse()
        dishTitleLabel.text = nil
        dishDescriptionLabel.text = nil
        dishCaloryLabel.text = nil
        dishImageView.image = nil
    }
    
    func configureCell(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
        dishCaloryLabel.text = dish.formattedCalories
    }
    
}
