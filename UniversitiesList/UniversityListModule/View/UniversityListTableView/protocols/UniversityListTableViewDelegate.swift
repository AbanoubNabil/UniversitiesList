//
//  UniversityListTableViewDelegate.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

protocol UniversityListTableViewDelegate: AnyObject {
    func numberOfRows() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UniversityUIModel?
    func didSelectRowAt(indexPath: IndexPath)
}
