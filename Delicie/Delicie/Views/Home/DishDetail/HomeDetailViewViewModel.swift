//
//  HomeDetailViewViewModel.swift
//  Delicie
//
//  Created by Mesut Gedik on 9.01.2024.
//

import UIKit
import Kingfisher

final class HomeDetailViewViewModel{
    
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
    
    public func fetchImage2(imageCompletionHandler: @escaping (UIImage?) -> Void){
        guard let url = dish.image?.asUrl else {
                    return  imageCompletionHandler(nil)
                }
        let resource = KF.ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                   switch result {
                   case .success(let value):
                       imageCompletionHandler(value.image)
                       print("image is downloaded")
                   case .failure:
                       imageCompletionHandler(nil)
                       print("image is not downloaded")
                   }
               }
    }
    
}
