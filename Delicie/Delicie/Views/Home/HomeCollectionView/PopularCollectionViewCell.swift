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
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    let popularTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    let popularCaloriesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Less Popular"
        label.textAlignment = .left
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    let popularDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UnPopular"
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    // MARK: -init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setup()
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
//        contentView.addSubviews(
//            popularTitleLabel,
//            popularImageView,
//            popularSecondLabel,
//            popularThirdLabel)
        contentView.addShadow(self)
    }
    
    private func layout(){
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
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
