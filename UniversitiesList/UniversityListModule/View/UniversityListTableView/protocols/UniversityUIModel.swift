//
//  UniversityListCellUIModel.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

struct UniversityUIModel {
    init(name: String? = nil, state: String? = nil, country: String? = nil, countryCode: String? = nil, webPages: [String]? = nil) {
        self.name = name
        self.state = state
        self.country = country
        self.countryCode = countryCode
        self.webPages = webPages
    }
    
    var name: String?
    var state: String?
    var country: String?
    var countryCode: String?
    var webPages: [String]?
}
