//
//  UniversityEntity.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import RealmSwift

class UniversityEntity: Object {
    // MARK: - Attributes
    @objc dynamic var countryCode : String?
    @objc dynamic var name : String?
    @objc dynamic var country : String?
    var domains : [String]?
    var webPages : [String]?
    @objc dynamic var state : String?
    @objc dynamic var _id = UUID().uuidString

      override static func primaryKey() -> String? {
          return "_id"
      }
    // MARK: - Methods
    convenience init(countryCode: String?, name: String?, country: String?, domains: [String]?, webPages: [String]?, state: String?) {
        self.init()
        self.countryCode = countryCode
        self.name = name
        self.country = country
        self.domains = domains
        self.webPages = webPages
        self.state = state
    }
}

extension UniversityEntity {
    func toModel() -> University {
        return University(countryCode: countryCode, name: name, country: country, domains: domains, webPages: webPages, state: state)
    }
}
