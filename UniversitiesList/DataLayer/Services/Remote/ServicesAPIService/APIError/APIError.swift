//
//  APIError.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 19/12/2023.
//

import Foundation

enum APIError: Error, Equatable {
    case invalidURL
    case invalidResponse
    case pageNotFound
    case internetDisconnection
    case noData
    case serverError
    case manyRequests
    case conversionIssue
    case invalidAPI
    case unknownError(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The requested resource does not exist."
        case .invalidResponse:
            return "Invalid response"
        case .pageNotFound:
            return "Requested page not found!"
        case .internetDisconnection:
            return "Internet connection not available!"
        case .noData:
            return "Oops! There are no matches for entered text."
        case .serverError:
            return "500 Server error"
        case .manyRequests:
            return "429 Too Many Requests"
        case .conversionIssue:
            return "Oops! Getting some conversion issue."
        case .invalidAPI:
            return "No API Key was specified or an invalid API Key was specified."
        case .unknownError(let errorMessage):
            return errorMessage
        }
    }
    
    static func checkErrorCode(_ errorCode: Int = 0) -> APIError {
        switch errorCode {
        case 400:
            return .invalidURL
        case 500:
            return .serverError
        case 404:
            return .pageNotFound
        case 429:
            return .manyRequests
        case 101:
            return .invalidAPI
        default:
            return .unknownError("An error occurred with error code: \(errorCode)")
        }
    }
}
