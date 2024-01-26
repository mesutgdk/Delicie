//
//  APIResponse.swift
//  Delicie
//
//  Created by Mesut Gedik on 26.01.2024.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable{
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
