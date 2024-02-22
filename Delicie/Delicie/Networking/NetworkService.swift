//
//  NetworkService.swift
//  Delicie
//
//  Created by Mesut Gedik on 24.01.2024.
//

import Foundation

struct NetworkService{
    
    static let shared = NetworkService()
    
    private init(){}
    
    func fetchAllCategories(complition: @escaping(Result<AllDishes, Error>) -> Void){
        request(route: .fecthAllCategories, method: .get, completion: complition)
    }
    
    func placeOrder(dishID: String, name: String, comletion: @escaping((Result<Order, Error>) -> Void)){
        let param = ["name": name]
        
        request(route: .placeOrder(dishID), method: .post, parameters: param, completion: comletion)
    }
    
    func fetchCategoryDishs(categoryId: String, completion: @escaping(Result<[Dish], Error>) -> Void){
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    private func request<T: Decodable>(route: Route,
                                       method: Method,
                                       parameters: [String: Any]? = nil,
                                       
                                       completion: @escaping (Result<T, Error>) -> Void){
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
//                let responseString = String(data: data, encoding: .utf8) ?? "Could Not Stringfy Your Data"
//                print("Responce is : \(responseString)")
                
            } else if let error = error {
                result = .failure(error)
                print("The Error is : \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //TODO decode our result and send back to the user
                self.handleResponse(result: result,
                                    completion: completion)
            }
        }.resume()
        
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data,Error>?,
                                              completion: (Result<T,Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            //            print(try? JSONSerialization.jsonObject(with: data))
            
            let decoder = JSONDecoder()
            
            guard let responce = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            
            if let error = responce.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData = responce.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.errorDecoding))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// CreatingRequest: this func helps to generate an urlRequest
    /// - Parameter:
    ///   - route: path to endpoint
    ///   - method: type of request
    ///   - parameters: extra information
    ///  - Returns URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String:Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseURL + route.descripton
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try?
                JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
        
    }
}
