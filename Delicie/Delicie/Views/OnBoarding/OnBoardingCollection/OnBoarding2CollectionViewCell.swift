//
//  OnBoarding2CollectionViewCell.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.12.2023.
//

import UIKit

final class OnBoarding2CollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "OnBoardingCollectionCell"
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1).withSize(31)
        label.numberOfLines = 0
        return label
    }()
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    // MARK: - init
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
        contentView.addSubviews(imageView, firstLabel, secondLabel)
     
    }
    
    private func layout(){
        //imageview
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 150)
//            imageView.centerYAnchor.constraint(equalTo: viecontentVieww.centerYAnchor)
        ])
        
        //firstLabel
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 100),
            firstLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 16),
            firstLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16),
            
        ])

        //secondLabel
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 16),
            secondLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            secondLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16),
            
        ])

    }
    // MARK: - prepare to reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        firstLabel.text = nil
        secondLabel.text = nil
    }
    
    public func configure(with viewModel: OnBoarding2CollectionViewCellModel){
        imageView.image = UIImage(named: viewModel.imageName)
        firstLabel.text = viewModel.firstText
        secondLabel.text = viewModel.secondText
    }
    
    
}
