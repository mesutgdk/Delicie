//
//  Order.swift
//  Delicie
//
//  Created by Mesut Gedik on 23.01.2024.
//

import Foundation

struct Order:Decodable{
    let id : String?
    let name: String?
    let dish: Dish?
}
