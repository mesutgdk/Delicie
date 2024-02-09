//
//  ChefCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 28.12.2023.
//


import UIKit
import Kingfisher

final class ChefCollectionViewViewModel: NSObject{
    
    
//    lazy var specials: [Dish] = []
    private lazy var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is my favorite dish.", calories: 34),
        .init(id: "id1", name: "Beans and Garri", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=3", description: "This is the best I ever had", calories: 1006),
        .init(id: "id1", name: "Garri", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 34),
        .init(id: "id1", name: "Indomia", image: "https://source.unsplash.com/random/200x200?sig=1", description: "This is the best I ever had", calories: 214),
        .init(id: "id1", name: "Pizza", image: "https://source.unsplash.com/random/200x200?sig=2", description: "This is the best I ever had", calories: 1006)
    ]
    
    public func fetchImage(url:URL?, imageCompletionHandler: @escaping (Result<RetrieveImageResult, KingfisherError>) -> Void){
        
        guard let url = url else {
            return imageCompletionHandler(.failure(.requestError(reason: .emptyRequest)))
        }
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, completionHandler: imageCompletionHandler)
        
    }
}

