// 
//  UniversityListViewController.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit

class UniversityListViewController: UIViewController, UniversityListViewProtocol {
    
    // MARK: - Outlets
    @IBOutlet private weak var universityTableView: UniversityListTableView!
    
    // MARK: - Attributes
	var presenter: UniversityListPresenterProtocol!

    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    // MARK: - Deallocation
    deinit {
        debugPrint("\(UniversityListViewController.self)  release from memory")
    }
}

// MARK: - Setup UI
extension UniversityListViewController {
    
    func setupUI() {
        setupUniversityTableView()
    }
}

// MARK: - Private Handler
extension UniversityListViewController {
    
    private func setupUniversityTableView() {
        universityTableView.tableDelegate = self
    }
    
    func reloadTable() {
        universityTableView.reloadData()
    }
}

// MARK: - UniversityListTableViewDelegate
extension UniversityListViewController: UniversityListTableViewDelegate {
    
    func numberOfRows() -> Int {
        presenter.numberOfRows()
    }
    
    func cellForRowAt(indexPath: IndexPath) -> UniversityUIModel? {
        presenter.cellForRowAt(indexPath: indexPath)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        presenter.didSelectRowAt(indexPath: indexPath)
    }
}
