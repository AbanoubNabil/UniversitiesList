//
//  Constant.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 04/02/23.
//

import Foundation

enum APIConstants {
    
    enum Keys {
        static let scheme = "http"
        static let host = "universities.hipolabs.com"
    }
    
    enum Path {
        static let universities = "/search"
    }
    
    enum Token {
        static let key = "access_key"
    }
}


enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
}


enum HTTPHeaderField: String {
    
    case contentType = "Content-Type"
}
