//
//  AllDishes.swift
//  Delicie
//
//  Created by Mesut Gedik on 30.01.2024.
//

import Foundation

struct AllDishes: Decodable{
    let categories: [DishCategory]?
    let dishes: [Dish]?
    let specials : [Dish]?
}
