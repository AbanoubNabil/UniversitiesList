//
//  LocalService.swift
//  UniversitiesList
//
//  Created by Abanoub Nabil on 5/6/24.
//

import Foundation


class UnivisttityLocalService: UniversitiesLocalServiceProtocol {
    func getLocalUniversities() -> [UniversityEntity] {
        let model: [UniversityEntity] = UniversityDb.shared.realmObjects(type: UniversityEntity.self) ?? []
        return model
    }
    
    func saveUniversities(universities: [University]) {
        UniversityDb.shared.deleteAll()
        for university in universities {
            UniversityDb.shared.save(object: university.toRealm())
        }
    }
}
