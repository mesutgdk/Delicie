//
//  Raoute.swift
//  Delicie
//
//  Created by Mesut Gedik on 24.01.2024.
//

import Foundation

enum Route{
    
    static let baseURL = "https://yummie.glitch.me"
    
    case temp
    
    var descripton : String {
        switch self {
        case .temp:
            return "/dishes/1"
        }
    }
    
}
