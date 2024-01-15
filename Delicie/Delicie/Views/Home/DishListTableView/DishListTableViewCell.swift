//
//  DishListTableViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 15.01.2024.
//

import UIKit

final class DishListTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: DishListTableViewCell.self)
        
    let imageView: UIImageView = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubviews(imageView)

        contentView.addShadow(self) // extensionda tanımladım

    }
    private func layout(){
        //imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            imageView.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor, multiplier: 1),
            imageView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1),
            
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.topAnchor),
            stackView.leftAnchor.constraint(equalToSystemSpacingAfter: imageView.rightAnchor, multiplier: 2),
            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            stackView.rightAnchor.constraint(equalToSystemSpacingAfter: contentView.rightAnchor, multiplier: -2)
        ])
    }
    

}
