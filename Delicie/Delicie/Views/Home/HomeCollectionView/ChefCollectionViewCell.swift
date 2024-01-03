//
//  ChefCollectionViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 21.12.2023.
//

import UIKit

final class ChefCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ChefCollectionViewCell.self)
    
    let chefImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .systemPink
//        imageView.cornerRadius = 5
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.spacing = 8
        
        return stackView
    }()
    
    let chefTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    let chefLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    let chefDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 17, weight: .regular)
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
        stackView.addArrangedSubview(chefTitleLabel)
        stackView.addArrangedSubview(chefLabel)
        stackView.addArrangedSubview(chefDescriptionLabel)
        
        contentView.addSubviews(chefImageView,stackView)
        
    }
    
    private func layout(){
        //chefImageView
        NSLayoutConstraint.activate([
            chefImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            chefImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            chefImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leftAnchor.constraint(equalTo: chefImageView.rightAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    
    override func prepareForReuse() {  // hücreleri tekrar kullanabilmek için nille
        super.prepareForReuse()
        chefTitleLabel.text = nil
        chefLabel.text = nil
        chefDescriptionLabel.text = nil
        chefImageView.image = nil
    }
    
    func configureCell(){
        
    }
    
}
