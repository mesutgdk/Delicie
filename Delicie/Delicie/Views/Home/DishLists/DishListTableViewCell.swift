//
//  DishListTableViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 15.01.2024.
//

import UIKit

final class DishListTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: DishListTableViewCell.self)
    
    static let rowHeight : CGFloat = 112
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = 5
        imageView.clipsToBounds = true
//        imageView.backgroundColor = .blue
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dishImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
    
    private func setup(){
        contentView.backgroundColor = .systemBackground
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        contentView.addSubviews(dishImageView,stackView)
        
        //        contentView.addShadow(self) // extensionda tanımladım
        
    }
    private func layout(){
        //imageView
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            //            dishImageView.widthAnchor.constraint(equalToConstant: 50),
            dishImageView.widthAnchor.constraint(equalTo: dishImageView.heightAnchor)
        ])
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: dishImageView.topAnchor),
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: dishImageView.rightAnchor, multiplier: 2),
            stackView.bottomAnchor.constraint(equalTo: dishImageView.bottomAnchor),
            stackView.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: -2)
        ])
    }
    
    func configure(dish: Dish){
        
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        
        let viewModel = DishTableViewCellViewModel(dish: dish)
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                self?.dishImageView.image = data.image
            case .failure(let error):
                print(error.errorDescription ?? error.localizedDescription)
                break
            }
        }
    }
}
