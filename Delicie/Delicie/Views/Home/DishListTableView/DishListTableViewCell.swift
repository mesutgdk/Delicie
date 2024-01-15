//
//  DishListTableViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 15.01.2024.
//

import UIKit

final class DishListTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: DishListTableViewCell.self)
        
    let dishImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.americas")
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.spacing = 8
        stackView.distribution = .fillEqually
//        stackView.backgroundColor = .cyan
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    let descriptionLabel: UILabel = {
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

        contentView.addShadow(self) // extensionda tanımladım

    }
    private func layout(){
        //imageView
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            dishImageView.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 1),
            dishImageView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1),
            
            dishImageView.widthAnchor.constraint(equalToConstant: 50),
            dishImageView.heightAnchor.constraint(equalTo: dishImageView.widthAnchor)
        ])
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: dishImageView.topAnchor),
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: dishImageView.rightAnchor, multiplier: 2),
            stackView.bottomAnchor.constraint(equalTo: dishImageView.bottomAnchor),
            stackView.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: -2)
        ])
    }
    
    func configure(viewModel: DishTableViewCellViewModel){
        
        titleLabel.text = viewModel.dish.name
        descriptionLabel.text = viewModel.dish.description
        
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