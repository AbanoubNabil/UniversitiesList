// 
//  UniversityListProtocols.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import Foundation

// MARK: - Router
protocol UniversityListRouterProtocol: AnyObject {
    func go(to route: UniversityListRouter.Route)
}


// MARK: - Interactor
protocol UniversityListInteractorProtocol: AnyObject {
    func fetchUniversityData()
}

protocol UniversityListInteractorOutputProtocol: AnyObject {

    func didSuccessGetUniversities(model: [UniversityUIModel])
    func didFailFetchDate(message: String)
}

// MARK: - Presenter
protocol UniversityListPresenterProtocol: AnyObject, UniversityListTableViewDelegate {
    
    init(view: UniversityListViewProtocol,
         interactor: UniversityListInteractorProtocol,
         router: UniversityListRouterProtocol)
    
    func viewDidLoad()
}

// MARK: - View
protocol UniversityListViewProtocol: AnyObject {
    
    var presenter: UniversityListPresenterProtocol! { get set }
    
    func setupUI()
    func reloadTable()
}
