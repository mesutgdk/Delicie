//
//  Raoute.swift
//  Delicie
//
//  Created by Mesut Gedik on 24.01.2024.
//

import Foundation

enum Route{
    
    static let baseURL = "https://yummie.glitch.me"
    
    case fecthAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    var descripton : String {
        switch self {
        case .fecthAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishID):
            return "/orders/\(dishID)"
        case .fetchCategoryDishes(let categoryID):
            return "/dishes/\(categoryID)"
        case .fetchOrders:
            return "/orders"
        }
    }
    
}
