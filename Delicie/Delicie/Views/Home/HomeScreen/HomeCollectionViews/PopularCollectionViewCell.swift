//
//  PopularCollectionViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 21.12.2023.
//

import UIKit
import Kingfisher

final class PopularCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = String(describing: PopularCollectionViewCell.self)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    let popularImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .systemPink
        imageView.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let popularTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    let popularCaloriesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    let popularDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .regular)
//        label.adjustsFontForContentSizeCategory = true
//        label.numberOfLines = 1
        return label
    }()
    
    // MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(){
        stackView.addArrangedSubview(popularTitleLabel)
        stackView.addArrangedSubview(popularImageView)
        stackView.addArrangedSubview(popularCaloriesLabel)
        stackView.addArrangedSubview(popularDescriptionLabel)
        
        contentView.addSubview(stackView)
        contentView.addShadow(self)
        
        contentView.backgroundColor = .systemBackground
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            popularTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    
    override func prepareForReuse() {  // hücreleri tekrar kullanabilmek için nille
        super.prepareForReuse()
        popularTitleLabel.text = nil
        popularDescriptionLabel.text = nil
        popularCaloriesLabel.text = nil
        popularImageView.image = nil
    }
    
    func configure(dish:Dish){
        popularTitleLabel.text = dish.name
        popularImageView.kf.setImage(with: dish.image?.asUrl)
        popularCaloriesLabel.text = dish.formattedCalories
        popularDescriptionLabel.text = dish.description
    }
}
