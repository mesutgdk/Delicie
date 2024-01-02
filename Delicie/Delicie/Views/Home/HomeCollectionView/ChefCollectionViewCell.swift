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
        imageView.contentMode = .scaleAspectFill
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
}
