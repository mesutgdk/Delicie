//
//  HomeDetailView.swift
//  Delicie
//
//  Created by Mesut Gedik on 7.01.2024.
//

import UIKit

final class DishDetailView: UIView {
    
    private let viewModel : DishDetailViewViewModel
    
    let detailedImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    private let verticalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private let horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    private let caloryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .systemRed
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.attributedText = NSAttributedString(string: "sada asda adsad  awd a ")
        label.textColor = .systemGray
        
        return label
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your name"
        
        return textField
    }()
    
    private let orderButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Place Order", for: .normal)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.cornerRadius = 10
        
        return button
    }()
    // MARK: - Init

    init(frame: CGRect, viewModel: DishDetailViewViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup & Layout

    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        
        configure(viewModel: viewModel)
        
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(caloryLabel)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(textField)
        verticalStackView.addArrangedSubview(orderButton)
        
        addSubviews(detailedImageView,verticalStackView)
        
    }
    private func layout(){
        //detailedImageView
        NSLayoutConstraint.activate([
            detailedImageView.topAnchor.constraint(equalTo: topAnchor),
            detailedImageView.leftAnchor.constraint(equalTo: leftAnchor),
            detailedImageView.rightAnchor.constraint(equalTo: rightAnchor),
            detailedImageView.bottomAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // verticalStackView
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: detailedImageView.bottomAnchor, constant: 16),
            verticalStackView.leftAnchor.constraint(equalTo: leftAnchor,constant: 16),
            verticalStackView.rightAnchor.constraint(equalTo: rightAnchor,constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
        //secondLabel
        NSLayoutConstraint.activate([
            caloryLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        // textField
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 16)
        ])
        
        //button
        NSLayoutConstraint.activate([
            orderButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configure(viewModel: DishDetailViewViewModel){
        
        titleLabel.text = viewModel.dish.name
        caloryLabel.text = viewModel.dish.formattedCalories
        descriptionLabel.text = viewModel.dish.description
        

        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                self?.detailedImageView.image = data.image
            case .failure(let error):
                print(error.errorDescription ?? error.localizedDescription)
                break
            }
        }
        //        viewModel.fetchImage { [weak self] image in
        //            guard let image = image else {return}
        //
        //            self?.detailedImageView.image = image
        //        }
    }

}
// MARK: - Action

extension DishDetailView{
    private func createNextButtonAction(){
        let action = UIAction{[weak self] _ in
            self?.orderButtonTapped()
        }
        orderButton.addAction(action, for: .primaryActionTriggered)

    }
    
    private func orderButtonTapped(){
        
    }
}
