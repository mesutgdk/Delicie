//
//  DishCategory.swift
//  Delicie
//
//  Created by Mesut Gedik on 22.12.2023.
//

import Foundation

struct DishCategory: Decodable{
    let id, name, image: String?
    
    // to translate exactly the code coming from backend to our code means.
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
