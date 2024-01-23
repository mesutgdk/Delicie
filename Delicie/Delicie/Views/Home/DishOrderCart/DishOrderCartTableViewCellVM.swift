//
//  DishOrderCartTableViewCellVM.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import Kingfisher

final class DishOrderCartTableViewCellVM{
    
    let order : Order
    
    // MARK: - init
    
    init(order : Order){
        self.order = order
    }
    
    public func fetchImage(imageCompletionHandler: @escaping (Result<RetrieveImageResult, KingfisherError>) -> Void){
        
        guard let url = order.dish?.image?.asUrl else {
            return imageCompletionHandler(.failure(.requestError(reason: .emptyRequest)))
        }
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, completionHandler: imageCompletionHandler)
        
    }
}
