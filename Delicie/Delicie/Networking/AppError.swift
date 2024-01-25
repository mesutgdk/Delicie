//
//  AppError.swift
//  Delicie
//
//  Created by Mesut Gedik on 25.01.2024.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "No idea about the problem!"
        case .invalidURL:
            return "Invalid URL, jsut check THAT!"
        case .serverError(let error):
            return error
        }
    }
}
