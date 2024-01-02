//
//  Dish.swift
//  Delicie
//
//  Created by Mesut Gedik on 26.12.2023.
//

import Foundation

struct Dish{
    let id,name,image,description : String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories "
//        String(format: "%.2f calories",calories ?? 0)
    }
}
