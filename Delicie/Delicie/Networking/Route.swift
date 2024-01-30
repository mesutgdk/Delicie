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
    
    var descripton : String {
        switch self {
        case .fecthAllCategories:
            return "/dish-categories"
        }
    }
    
}
