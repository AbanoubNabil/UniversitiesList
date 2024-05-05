// 
//  UniversityListInteractor.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit

class UniversityListInteractor: UniversityListInteractorProtocol {
    
    // MARK: - Attributes
    weak var presenter: UniversityListInteractorOutputProtocol?

    var remoteDataSource: RemoteDataSourceProtocol
    var localDataSource: LocalDataSourceProtocol
    
    // MARK: - Init
    init(remoteDataSource: RemoteDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    
    func fetchUniversityData() {
        remoteDataSource.getUniversities(.getUnivresities()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.handleSuccessRemoteFetch(response: data)
            case .failure(let error):
                handleFailure(with: error)
            }
        }
    }
    
    // call local data soruce for get local data
   private func handleFailure(with error: APIError) {
       if error == .internetDisconnection {
           // handle UI in case intenet Disconnection
       }
       let universities = localDataSource.getLocalUniversities()
        if universities.isEmpty { // not show error secreen
            self.presenter?.didFailFetchDate(message: error.localizedDescription)
        } else { // sent data To Presenter
            let list = universities.map { university in
                UniversityUIModel(name: university.name, state: university.state, country: university.country, countryCode: university.countryCode, webPages: university.webPages)
            }
            DispatchQueue.main.async {
                self.presenter?.didSuccessGetUniversities(model: list)
            }
        }
    }
    
   private func handleSuccessRemoteFetch(response: Data) {
       if let model = try? JSONDecoder().decode([University].self, from: response) {
           let list = model.map { university in
               UniversityUIModel(name: university.name, state: university.state, country: university.country, countryCode: university.countryCode, webPages: university.webPages)
           }
           
           self.presenter?.didSuccessGetUniversities(model: list)
           self.localDataSource.saveUniversities(universities: model)
       }
    }
}
