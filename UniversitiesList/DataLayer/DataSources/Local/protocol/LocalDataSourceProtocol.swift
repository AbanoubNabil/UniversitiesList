//
//  LocalDataSourceProtocol.swift
//  UniversitiesList
//
//  Created by Abanoub Nabil on 5/6/24.
//

import Foundation

protocol LocalDataSourceProtocol {
    
    init(localService: UniversitiesLocalServiceProtocol)
    
    func getLocalUniversities() -> [University]
    func saveUniversities(universities: [University])
}
