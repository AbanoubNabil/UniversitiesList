//
//  UniversityRemoteDataSourceProtocol.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

protocol RemoteServiceProtocol: APIServiceProtocol {
    func getUniversities(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ())
}

protocol RemoteDataSourceProtocol {
    
    init(apiService: APIServiceProtocol)
    
    func getUniversities(_ endPoint: EndPoint, completion: @escaping (Result<Data, APIError>) -> ())
}
