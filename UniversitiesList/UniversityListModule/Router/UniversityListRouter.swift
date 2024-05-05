// 
//  UniversityListRouter.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit
import UnivirsityDetails

class UniversityListRouter: UniversityListRouterProtocol {
    
    enum Route {
        case details(UniversityUIModel?, delegate: UniversityDetailsViewControllerDelegate)
    }
    
    // MARK: - Attributes
    weak var viewController: UIViewController?

    // MARK: - Methods
    static func assembleModule() -> UIViewController {
        let view = UniversityListViewController()
        let remoteDataSource = RemoteDataSource()
        let localDataSource = LocalDataSource()
        let interactor = UniversityListInteractor(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        let router = UniversityListRouter()
        let presenter = UniversityListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    // MARK: - Navigation
    func go(to route: Route) {
        switch route {
        case .details(let model, let delegate):
            navigateToUniversityDetails(with: model, delegate: delegate)
        }
    }
}

//MARK: -
extension UniversityListRouter {
    
    private func navigateToUniversityDetails(with model: UniversityUIModel?, delegate: UniversityDetailsViewControllerDelegate) {
        guard let model = model else { return }
        let details = UniversityDetailsInputModel(name: model.name, state: model.state, country: model.country, countryCode: model.countryCode, webPages: model.webPages)
        let universityDetailsViewController = UniversityDetailsRouter.assembleModule(model: details, delegate: delegate)
        viewController?.present(universityDetailsViewController, animated: true)
    }
}
