//
//  EndPoint.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

struct EndPoint {
    
    let httpMethod: HTTPMethod
    
    private let path: String
    
    private(set) var parameter: [String: Any]? /// queryItems
    
    private(set) var bodyRequest: [String: Any]?
    
    private(set) var headers: [HTTPHeaderField: String]?
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = APIConstants.Keys.scheme
        components.host = APIConstants.Keys.host
        components.path = path
        if parameter?.isEmpty == false {
            components.setQueryItems(with: parameter!)
        }
        return components.url
    }
    
    /// GET request
    private init(method: HTTPMethod, path: String, parameter: [String: Any]?) {
        self.httpMethod = method
        self.path = path
        self.parameter = parameter
    }
    
    /// POST request
    private init(method: HTTPMethod, path: String, bodyRequest: [String: Any]?) {
        self.httpMethod = method
        self.path = path
        self.bodyRequest = bodyRequest
    }
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: Any]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}

// MARK: - Events
extension EndPoint {
    
    static func getUnivresities() -> EndPoint {
        let param = ["country":"United Arab Emirates"]
        return EndPoint(method: .get, path: APIConstants.Path.universities, parameter: param)
    }
    
}
