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
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        imageView.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        //        stackView.spacing = 8
        stackView.distribution = .fillEqually
        //        stackView.backgroundColor = .cyan
        
        return stackView
    }()
    
    private let dishTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    private let dishDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let dishCaloryLabel: UILabel = {
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
    
    // MARK: - setup&layout
    private func setup(){
        stackView.addArrangedSubview(dishTitleLabel)
        stackView.addArrangedSubview(dishDescriptionLabel)
        stackView.addArrangedSubview(dishCaloryLabel)
        
        contentView.addSubviews(dishImageView,stackView)
        contentView.addShadow(self)
        
        contentView.backgroundColor = .systemBackground
    }
    
    private func layout(){
        //chefImageView
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dishImageView.widthAnchor.constraint(equalTo: dishImageView.heightAnchor)
        ])
        //stackView
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: dishImageView.rightAnchor, constant: 12),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
        ])
    }
    // hücreleri tekrar kullanabilmek için nille
    override func prepareForReuse() {
        super.prepareForReuse()
        dishTitleLabel.text = nil
        dishDescriptionLabel.text = nil
        dishCaloryLabel.text = nil
        dishImageView.image = nil
    }
    
    func configureCell(dish: Dish){
        
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
        dishCaloryLabel.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asUrl)  // problem\\\****
        
    }
    
}
