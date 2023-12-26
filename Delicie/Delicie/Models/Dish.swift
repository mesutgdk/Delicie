//
//  Dish.swift
//  Delicie
//
//  Created by Mesut Gedik on 26.12.2023.
//

import Foundation

struct Dish{
    let id,name,image,description : String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%2f",calories ?? 0)
    }
}
