//
//  DishTableViewCellViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 15.01.2024.
//

import Kingfisher

final class DishTableViewCellViewModel{
    
    let dish : Dish
        
    // MARK: - init

    init(dish : Dish){
        self.dish = dish
    }
    
    public func fetchImage(imageCompletionHandler: @escaping (Result<RetrieveImageResult, KingfisherError>) -> Void){
        
        guard let url = dish.image?.asUrl else {
            return imageCompletionHandler(.failure(.requestError(reason: .emptyRequest)))
                }
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, completionHandler: imageCompletionHandler)
        
    }
}
