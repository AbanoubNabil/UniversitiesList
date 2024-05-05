// 
//  UniversityListPresenter.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit
import UnivirsityDetails

class UniversityListPresenter: UniversityListPresenterProtocol {

    // MARK: - Attributes
    weak var view: UniversityListViewProtocol?
    var interactor: UniversityListInteractorProtocol
    var router: UniversityListRouterProtocol
    private var universityListUIModel: [UniversityUIModel]?
   
    // MARK: - Init
    required init(view: UniversityListViewProtocol,
                  interactor: UniversityListInteractorProtocol,
                  router: UniversityListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - Life Cycle
    func viewDidLoad() {
        view?.setupUI()
        fetchData()
    }
}

// MARK: - Private Handler
extension UniversityListPresenter {
    
    private func fetchData() {
        interactor.fetchUniversityData()
    }
}

// MARK: - UniversityListInteractorOutputProtocol
extension UniversityListPresenter: UniversityListInteractorOutputProtocol {
    
    func didSuccessGetUniversities(model: [UniversityUIModel]) {
        universityListUIModel = model
        view?.reloadTable()
    }
    
    func didFailFetchDate(message: String) {
        
    }
}

// MARK: - UniversityListTableViewDelegate
extension UniversityListPresenter {
    
    func numberOfRows() -> Int {
        universityListUIModel?.count ?? 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> UniversityUIModel? {
        universityListUIModel?[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        router.go(to: .details(universityListUIModel?[indexPath.row], delegate: self))
    }
}

// MARK: - UniversityDetailsViewControllerDelegate
extension UniversityListPresenter: UniversityDetailsViewControllerDelegate {
    
    func refreshList() {
        fetchData()
    }
}
