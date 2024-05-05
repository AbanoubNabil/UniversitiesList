//
//  UniversityListTableView.swift
//  UniversitiesApp
//
//  Created by Abanoub Nabil on 05/05/2024.
//

import UIKit

class UniversityListTableView: UITableView {
    
    private let cell = "UniversityListTableViewCell"
    weak var tableDelegate: UniversityListTableViewDelegate?
    
    //MARK: - init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerTableViewCell()
    }
    
    //MARK: - registerTableViewCell
    private func registerTableViewCell() {
        self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        self.dataSource = self
        self.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension UniversityListTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableDelegate?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell) as? UniversityListTableViewCell
        let model = tableDelegate?.cellForRowAt(indexPath: indexPath)
        cell?.configureCell(model: model)
        return cell ?? UITableViewCell()
    }
}
            
//MARK: - UITableViewDelegate
extension UniversityListTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableDelegate?.didSelectRowAt(indexPath: indexPath)
    }
}



