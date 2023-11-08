//
//  ViewController.swift
//  Delicie
//
//  Created by Mesut Gedik on 8.11.2023.
//

import UIKit

class ViewController: UIViewController {

    let dummyLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dummy Label"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 24)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(dummyLabel)
        
        NSLayoutConstraint.activate([
            dummyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dummyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    


}

