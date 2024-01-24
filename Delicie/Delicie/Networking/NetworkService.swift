//
//  NetworkService.swift
//  Delicie
//
//  Created by Mesut Gedik on 24.01.2024.
//

import Foundation

struct NetworkService{
    
    /// CreatingRequest
    /// route: path to endpoint
    /// method: type of request
    private func createRequest(route: Route, method: Method, parameters: [String:Any] = nil) -> URLRequest? {
        
        let urlString = Route.baseURL + route.descripton
        guard let url = urlString.asUrl else { return nil }
    }
}
