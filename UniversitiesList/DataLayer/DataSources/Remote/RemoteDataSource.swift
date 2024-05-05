//
//  RemoteDataSource.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

class RemoteDataSource {
    
    // MARK: - Attributes
    let apiService: APIServiceProtocol
    
    // MARK: - Initialization
    required init(apiService: APIServiceProtocol = APIService(session: URLSession.shared)) {
        self.apiService = apiService
    }
}

// MARK: -  UniversityRemoteDataSourceProtocol
extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getUniversities(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ()) {
        apiService.getDataFromURL(endPoint, completion: completion)
    }
}
