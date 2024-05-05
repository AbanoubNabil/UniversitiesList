//
//  UnivisttityLocalServiceProtocol.swift
//  UniversitiesList
//
//  Created by Abanoub Nabil on 5/6/24.
//

import Foundation

protocol UniversitiesLocalServiceProtocol: AnyObject {
    func getLocalUniversities() -> [UniversityEntity]
    func saveUniversities(universities: [University])
}

