//
//  LocalDataSource.swift
//  UniversitiesList
//
//  Created by Abanoub Nabil on 5/6/24.
//

import Foundation

class LocalDataSource: LocalDataSourceProtocol {
    
    let localService: UniversitiesLocalServiceProtocol
    
    required init(localService: UniversitiesLocalServiceProtocol = UnivisttityLocalService()) {
        self.localService = localService
    }
    
    func getLocalUniversities() -> [University] {
        return localService.getLocalUniversities().map { $0.toModel() }
    }
    
    func saveUniversities(universities: [University]) {
        localService.saveUniversities(universities: universities)
    }
}
