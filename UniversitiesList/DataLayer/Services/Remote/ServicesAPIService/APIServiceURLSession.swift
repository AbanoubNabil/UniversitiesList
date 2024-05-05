//
//  APIService.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

protocol APIServiceProtocol: AnyObject {
    func getDataFromURL(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ())
}

final class APIService: APIServiceProtocol {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func getDataFromURL(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ()) {
        
        guard let url = endPoint.url else {
            return completion(.failure(APIError.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        
        if let headers = endPoint.headers {
            headers.forEach { header in
                request.addValue(header.value, forHTTPHeaderField: header.key.rawValue)
            }
        }
        
        if let body = endPoint.bodyRequest {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let task = session.apiServiceDataTask(with: request) { (data, response, error) in
            
            if !Utilities.isInternetAvailable() {
                completion(.failure(APIError.internetDisconnection))
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                completion(.failure(APIError.checkErrorCode((response as? HTTPURLResponse)?.statusCode ?? 0)))
                return
            }
            guard data != nil else {
                completion(.failure(APIError.noData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(data!))
            }
        }
        task.resume()
    }
    
}
