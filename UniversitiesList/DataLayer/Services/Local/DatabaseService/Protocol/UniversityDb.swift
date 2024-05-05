//
//  UniversityDb.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation
import RealmSwift

class UniversityDb: RealmDatabaseProtocol {
    var dbName: String { "UniversityRealmDb" }
    var schemaVersion: UInt64 { 1 }
    var objectTypes: [Object.Type] {[UniversityEntity.self]}
    var realm: Realm?

    static let shared: UniversityDb = UniversityDb()
    private init() {
        self.initializeDB { success, _ in
            if !success {
                print("UniversityDb failed to initialize")
            }
        }
    }
}
