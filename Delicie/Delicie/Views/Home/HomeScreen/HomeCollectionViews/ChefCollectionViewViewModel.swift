//
//  ChefCollectionViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 28.12.2023.
//


import UIKit
import Kingfisher

final class ChefCollectionViewViewModel: NSObject{
    
    
    lazy var specials: [Dish] = []
    
    
    public func fetchImage(url:URL?, imageCompletionHandler: @escaping (Result<RetrieveImageResult, KingfisherError>) -> Void){
        
        guard let url = url else {
            return imageCompletionHandler(.failure(.requestError(reason: .emptyRequest)))
        }
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, completionHandler: imageCompletionHandler)
        
    }
}

